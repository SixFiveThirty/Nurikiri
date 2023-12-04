package com.nurikiri.service;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.nurikiri.domain.ReceiptOCRVO;
import com.nurikiri.domain.clovaOcr.Fields;
import com.nurikiri.domain.clovaOcr.TextExtraction;
import com.nurikiri.mapper.ReceiptOCRMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class OcrServiceImpl implements OcrService {
	private ReceiptOCRMapper receiptMapper;
	
	public static final String THUMBNAIL_UPLOAD_DIR = "/Users/jeonhayoon/nurikiri_image/receipt";
	
	private final String clovaOcrApiUrl = "https://00t4hthuv6.apigw.ntruss.com/custom/v1/26194/dd29d2e86fd7030ed60487dfe050756ad233765d5f061cc27ef656bdec4371c6/infer";
	private final String clovaOcrApiKey = "eGhka2R4bWRpYU9UelR1VG16dG5rYnh3S1FIekxRVVA=";
	
	@Override
	public String extractTextFromImage(MultipartFile part, Principal principal, Long sno, HttpServletRequest request) throws DuplicateKeyException, Exception, IOException {
		File imageFile = new File(THUMBNAIL_UPLOAD_DIR, part.getOriginalFilename());
		part.transferTo(imageFile);
		try {
			URL url = new URL(clovaOcrApiUrl);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setUseCaches(false);
			con.setDoInput(true);
			con.setDoOutput(true);
			con.setReadTimeout(10000);
			con.setRequestMethod("POST");
			String boundary = "----" + UUID.randomUUID().toString().replaceAll("-", "");
			con.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + boundary);
			con.setRequestProperty("X-OCR-SECRET", clovaOcrApiKey);
			
			JSONObject json = new JSONObject();
			json.put("version", "V1");
			json.put("requestId", UUID.randomUUID().toString());
			json.put("timestamp", System.currentTimeMillis());
			
			List<Integer> templateIds = new ArrayList<Integer>();
			templateIds.add(27186);
			templateIds.add(27198);
			templateIds.add(27199);
			templateIds.add(27200);
			templateIds.add(27201);
			templateIds.add(27203);
			
			JSONObject image = new JSONObject();
			image.put("format", "jpg");
			image.put("name", "demo");
			image.put("templateIds", templateIds);
			JSONArray images = new JSONArray();
			images.put(image);
			json.put("images", images);
			String postParams = json.toString();
			log.info("postParams: " + postParams);
			
			con.connect();
			DataOutputStream wr = new DataOutputStream(con.getOutputStream());
			writeMultiPart(wr, postParams, imageFile, boundary);
			wr.close();
			log.info("완료");
			
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if(responseCode == 200) {
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			
			//gson 써서 변경. /vo(추천) 혹은 map으로 처리. 내가 원하는 키값만 추출 가능.
			//POJO 로그 찍힌 것을 카피해서 VO 객체 클래스를 자동으로 만들어내라.
			StringBuffer response = new StringBuffer();
			while((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
			
			System.out.println("결과값 : " + response);
			Gson gson = new Gson();
			TextExtraction text = gson.fromJson(response.toString(), TextExtraction.class);
			text.getImages().get(0);
			System.out.println(text);
			
			ReceiptOCRVO vo = new ReceiptOCRVO();
			
			for(Fields f : text.getImages().get(0).getFields()) {
				String name = f.getName();
				String infer = f.getInferText();
				System.out.println(name + infer);
				if(name.equals("매장명")) {
					vo.setStoreName(infer);
				} else if(name.equals("주소")) {
					vo.setStoreAddress(infer);
				} else if(name.equals("판매시간")) {
					vo.setSalesTime(infer);
				} else if(name.equals("합계")){
					vo.setSumPrice(infer);
				}
			}
			
			Long compareSno = receiptMapper.getStore(vo.getStoreAddress());
			
			if(compareSno.equals(sno)) {
				vo.setSno(sno);
			}
			
			vo.setUserName(principal.getName());
			
			System.out.println("getName : " + principal.getName());
			
			receiptMapper.insert(vo);
			
			System.out.println("vo : " + vo);
			
			request.setAttribute("msg", "영수증 인증 완료되었습니다.");
			request.setAttribute("url", "/store/get?sno=" + sno + "&state=success");
            return "alert";
		} catch(DuplicateKeyException e) {
			request.setAttribute("msg", "이미 인증된 영수증입니다.");
			request.setAttribute("url", "/store/get?sno=" + sno + "&state=fail");
            return "alert";
		} catch(IOException e) {
			request.setAttribute("msg", "영수증 분석에 실패했습니다.");
			request.setAttribute("url", "/store/get?sno=" + sno + "&state=fail");
            return "alert";
		} catch(Exception e) {
			request.setAttribute("msg", "영수증 인증에 실패했습니다.");
			request.setAttribute("url", "/store/get?sno=" + sno + "&state=fail");
            return "alert";
		}
	}
	
	private static void writeMultiPart(OutputStream out, String jsonMessage, File file, String boundary) throws IOException {
		StringBuilder sb = new StringBuilder();
		sb.append("--").append(boundary).append("\r\n");
		sb.append("Content-Disposition:form-data; name=\"message\"\r\n\r\n");
		sb.append(jsonMessage);
		sb.append("\r\n");
		
		out.write(sb.toString().getBytes("UTF-8"));
		out.flush();
		
		log.info("파일전송예정");
		
		if(file != null && file.isFile()) {
			out.write(("--" + boundary + "\r\n").getBytes("UTF-8"));
			StringBuilder fileString = new StringBuilder();
			fileString.append("Content-Disposition:form-data; name=\"file\"; filename=");
			fileString.append("\"" + file.getName() + "\"\r\n");
			fileString.append("Content-Type: application/octet-stream\r\n\r\n");
			out.write(fileString.toString().getBytes("UTF-8"));
			out.flush();
			
			try(FileInputStream fis = new FileInputStream(file)) {
				byte[] buffer = new byte[8192];
				int count;
				while((count = fis.read(buffer)) != -1) {
					out.write(buffer, 0, count);
					log.info("카운트 값 : " + count);
				}
				out.write("\r\n".getBytes());
			}
			
			out.write(("--" + boundary + "--\r\n").getBytes("UTF-8"));
		}
		out.flush();
	}
}

