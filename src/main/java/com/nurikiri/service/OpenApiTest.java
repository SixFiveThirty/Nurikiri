package com.nurikiri.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class OpenApiTest {

	public static void main(String[] args) {
		BufferedReader br = null;
		try {
			String urlstr = "http://api.odcloud.kr/api/3060079/v1/uddi:3f4d042d-e40d-4ce0-b0c5-97e490c47f78?page=1&perPage=10&serviceKey=Nk2pUfK3MWBviLT%2B0MeGn%2FUCepCitg4mk2c6uuia9e15eyEpqmIKnuUXamC2ck2PDJO92F0i6H4sJWJXV7m5BA%3D%3D";
						
			
			URL url = new URL(urlstr);
			HttpURLConnection urlconnection = (HttpURLConnection)url.openConnection();
			urlconnection.setRequestMethod("GET");
			br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(), "UTF-8"));
			String result = "";
			String line;
			while((line = br.readLine()) != null) {
				result = result + line +"\n";
			}
			System.out.println(result);
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
			
					
					
		}

	}


