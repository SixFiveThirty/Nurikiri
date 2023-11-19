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
import java.util.UUID;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.context.annotation.Bean;

import com.google.gson.JsonParser;
import com.nurikiri.domain.clova.Fields;
import com.nurikiri.domain.clova.OcrResult;

import okhttp3.MediaType;
import okhttp3.MultipartBody;
import okhttp3.MultipartBody.Part;
import okhttp3.RequestBody;
import retrofit2.Call;
import retrofit2.http.Query;

public class ClovaOcrServicEX1 {
	public static void main(String[] args) {
		
		ClovaOcrService api = ClovaOcrService.getService();
		
		try {
		
			/*  */
			// uri 타입을의 파일경로를 가진 RequestBody로 생성
			File testFile = new File("C:\\Users\\JU\\test.png");
			RequestBody fileBody = RequestBody.create(MediaType.parse("image/png"),"C:\\Users\\JU\\Downloads\\test.png");
			
			// RequestBody로 Multipart.part 생성
			MultipartBody.Part filePart = MultipartBody.Part.createFormData("test", "test.png", fileBody);
			System.out.println();
			// clova ocr에 파일 전송(post)
			Call<OcrResult> send = api.sandOcr(filePart);
			System.out.println("------------------post");
			System.out.println();

			//URL url = new URL(apiURL);
			//HttpURLConnection con = (HttpURLConnection)url.openConnection();
			//con.setUseCaches(false);
			//con.setDoInput(true);
			//con.setDoOutput(true);
			//con.setRequestMethod("POST");
			//con.setRequestProperty("Content-Type", "application/json; charset=utf-8");
			//con.setRequestProperty("X-OCR-SECRET", secretKey);
						
			JSONObject json = new JSONObject();
			json.put("version", "V2");
			json.put("requestId", UUID.randomUUID().toString());
			json.put("timestamp", System.currentTimeMillis());
			JSONObject image = new JSONObject();
			image.put("format", "jpg");
			//image.put("url", "https://kr.object.ncloudstorage.com/ocr-ci-test/sample/1.jpg"); // image should be public, otherwise, should use data
			FileInputStream inputStream = new FileInputStream("C:\\Users\\JU\\Downloads\\test.png");
			byte[] buffer = new byte[inputStream.available()];
			inputStream.read(buffer);
			inputStream.close();
			image.put("data", buffer);
			
			System.out.println("-----FileName-----"+ testFile.getName());
			System.out.println("-----FilePath-----"+ testFile.getPath());
			//System.out.println("----------"+ testFile.getAbsolutePath());
			
			System.out.println("----------json 처리중-----------");
			System.out.println(json);
			System.out.println();
						
			/*
			 * System.out.println("----------image 처리중-----------");
			 * System.out.println(image); System.out.println();
			 */
			
			image.put("name", "demo");
			JSONArray images = new JSONArray();
			images.put(image);
			json.put("images", images);
			String postParams = json.toString();
			
			/*
			 * System.out.println("-----------images 처리중----------");
			 * System.out.println(images); System.out.println();
			 * 
			 * System.out.println("----------json.toString()-----------");
			 * System.out.println(json.toString());
			 */
			
			//DataOutputStream wr = new DataOutputStream(con.getOutputStream());
			//wr.writeBytes(postParams); wr.flush(); wr.close();
			
			
			/*
			 * System.out.println("----------DataOutputStream wr-----------");
			 * System.out.println(wr); System.out.println();
			 */

			//int responseCode = con.getResponseCode();
			BufferedReader br;
			
			//if (responseCode == 200) { br = new BufferedReader(new
			//InputStreamReader(con.getInputStream())); } else { br = new
			//BufferedReader(new InputStreamReader(con.getErrorStream())); }
			
			String inputLine;
			StringBuffer response = new StringBuffer();
			
			//while ((inputLine = br.readLine()) != null) { response.append(inputLine); }
			//br.close();
			

			System.out.println("response:" + response);
			
//			String result = api.getOcr(inputLine);
			
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}