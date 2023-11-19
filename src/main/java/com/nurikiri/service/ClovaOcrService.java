package com.nurikiri.service;

import java.util.List;

import com.mysql.cj.protocol.x.ContinuousOutputStream;
import com.nurikiri.domain.clova.Fields;
import com.nurikiri.domain.clova.Images;
import com.nurikiri.domain.clova.OcrResult;

import okhttp3.MultipartBody;
import retrofit2.Call;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;
import retrofit2.http.Body;
import retrofit2.http.GET;
import retrofit2.http.Headers;
import retrofit2.http.Multipart;
import retrofit2.http.POST;
import retrofit2.http.Part;
import retrofit2.http.Query;

public interface ClovaOcrService {
	
	String BASE_URL = "https://00t4hthuv6.apigw.ntruss.com/custom/v1/26194/dd29d2e86fd7030ed60487dfe050756ad233765d5f061cc27ef656bdec4371c6/";
	
	@Multipart
	@POST("infer")
	@Headers({
		"X-OCR-SECRET: eGhka2R4bWRpYU9UelR1VG16dG5rYnh3S1FIekxRVVA=",
		"Content-Type: application/json"
	})
	Call<OcrResult> sandOcr();
	// 서버에 이미지 업로드 할 계획
	// multipart/form 이냐 json 이냐
	
	public static ClovaOcrService getService() {
		Retrofit retrofit = new Retrofit.Builder()
				.baseUrl(BASE_URL)
				.addConverterFactory(GsonConverterFactory.create())
				.build();
		
		return retrofit.create(ClovaOcrService.class);
	}

}
