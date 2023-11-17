package com.nurikiri.service;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.UUID;

import org.json.JSONArray;
import org.json.JSONObject;


// Request with application/json
public class ClovaOcrServicDemo2 {

	public static void main(String[] args) {
		String apiURL = "https://00t4hthuv6.apigw.ntruss.com/custom/v1/26194/dd29d2e86fd7030ed60487dfe050756ad233765d5f061cc27ef656bdec4371c6/infer";
		String secretKey = "eGhka2R4bWRpYU9UelR1VG16dG5rYnh3S1FIekxRVVA=";
		

		try {
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
			
//			System.out.println("----------"+file.getName());
//			System.out.println("----------"+file.getPath());
//			System.out.println("----------"+file.getAbsolutePath());
			
			JSONObject image = new JSONObject();
			image.put("format", "jpg");
			//image.put("url", "https://kr.object.ncloudstorage.com/ocr-ci-test/sample/1.jpg"); // image should be public, otherwise, should use data
			FileInputStream inputStream = new FileInputStream("C:\\Users\\JU\\Pictures\\test.png");
			byte[] buffer = new byte[inputStream.available()];
			inputStream.read(buffer);
			inputStream.close();
			image.put("data", buffer);
			
			
			  System.out.println("----------json 처리중-----------");
			  System.out.println(json); System.out.println();
			  
			  
			 // System.out.println("----------image 처리중-----------");
			 // System.out.println(image); System.out.println();
			 
			
			image.put("name", "demo");
			JSONArray images = new JSONArray();
			images.put(image);
			json.put("images", images);
			
			String postParams = json.toString();
			
			
			/*
			 * System.out.println("-----------images 처리중----------");
			 * System.out.println(images);
			 * System.out.println("------------------------------");
			 */
			 

			
			/*
			 * System.out.println("----------json.toString()-----------");
			 * System.out.println(json.toString()); System.out.println();
			 */

			DataOutputStream wr = new DataOutputStream(con.getOutputStream());
			wr.writeBytes(postParams);
			wr.flush();
			wr.close();
			
			
			 System.out.println("----------DataOutputStream wr-----------");
			 System.out.println(wr); System.out.println();
			
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
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}