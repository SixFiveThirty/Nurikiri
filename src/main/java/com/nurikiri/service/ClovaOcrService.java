package com.nurikiri.service;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.UUID;

import org.json.JSONArray;
import org.json.JSONObject;


// Request with application/json
public class ClovaOcrService {

	public String getocrresult() {
		String apiURL = "https://00t4hthuv6.apigw.ntruss.com/custom/v1/26194/dd29d2e86fd7030ed60487dfe050756ad233765d5f061cc27ef656bdec4371c6/infer";
		String secretKey = "eGhka2R4bWRpYU9UelR1VG16dG5rYnh3S1FIekxRVVA=";
		String result="";

		try {
			
			//이미지 받고 세팅해서
			//클로버 response 가공해서
			// 잘해본다
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setUseCaches(false);
			con.setDoInput(true);
			con.setDoOutput(true);
			con.setRequestMethod("POST");
			
			con.setRequestProperty("Content-Type", "application/json; charset=utf-8");
			con.setRequestProperty("X-OCR-SECRET", secretKey);

			JSONObject json = new JSONObject();
			json.put("version", "V2");
			json.put("requestId", UUID.randomUUID().toString());
			json.put("timestamp", System.currentTimeMillis());
			
			JSONObject image = new JSONObject();
			image.put("format", "jpg");
			FileInputStream inputStream = new FileInputStream("C:\\Users\\JU\\Pictures\\test.png");
			// url로 바꿔줘야함 찾아봐
			
			byte[] buffer = new byte[inputStream.available()];
			inputStream.read(buffer);
			inputStream.close();
			image.put("data", buffer);
			image.put("name", "demo");
			JSONArray images = new JSONArray();
			images.put(image);
			json.put("images", images);
			String postParams = json.toString();
			
			DataOutputStream wr = new DataOutputStream(con.getOutputStream());
			wr.writeBytes(postParams);
			wr.flush();
			wr.close();
			
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) {
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();

			System.out.println(response);
			// 객체 받아서
			// 원하는 부분 빼오기
			// 리턴
			return result;
		} catch (Exception e) {
			System.out.println(e);
		}
		return result;
	}

}