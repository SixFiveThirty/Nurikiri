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
import retrofit2.Response;
import retrofit2.http.Query;

public class ClovaOcrServicEX1 {
	public static void main(String[] args) {
		
		ClovaOcrService api = ClovaOcrService.getService();
		
		try {
		
		
			
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}