package com.nurikiri.service;

import com.nurikiri.domain.OcrDTO;
import com.nurikiri.domain.clovaOcr.TextExtraction;

import retrofit2.Call;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;
import retrofit2.http.Body;
import retrofit2.http.Headers;
import retrofit2.http.POST;

public interface OcrTestService {
	String BASE_URL = "https://00t4hthuv6.apigw.ntruss.com/";
	
	@POST("custom/v1/26194/dd29d2e86fd7030ed60487dfe050756ad233765d5f061cc27ef656bdec4371c6/infer")
	@Headers({
		"Content-Type : application/json",
		"X-OCR-SECRET : eGhka2R4bWRpYU9UelR1VG16dG5rYnh3S1FIekxRVVA="
	})
	Call<TextExtraction> textExtract(@Body OcrDTO ocrDTO);
	
	public static OcrTestService getService() {
		Retrofit retrofit = new Retrofit.Builder()
								.baseUrl("https://00t4hthuv6.apigw.ntruss.com/")
								.addConverterFactory(GsonConverterFactory.create())
								.build();
		
		return retrofit.create(OcrTestService.class);
	}
}
