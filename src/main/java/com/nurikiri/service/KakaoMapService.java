package com.nurikiri.service;

import com.nurikiri.domain.kakaomap.LocalResult;

import retrofit2.Call;
import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;
import retrofit2.http.GET;
import retrofit2.http.Headers;
import retrofit2.http.Query;

public interface KakaoMapService {
	String BASE_URL = "https://dapi.kakao.com/";
	
	@GET("/v2/local/search/keyword")
	@Headers({"Authorization: KakaoAK 13dd9acaaf36422a0233e1bbd7670493"})
	Call<LocalResult> searchLocal(@Query("query") String query, @Query("size") int size, @Query("page") int page);
	
	public static KakaoMapService getService() {
		Retrofit retrofit = new Retrofit.Builder()
								.baseUrl(BASE_URL)
								.addConverterFactory(GsonConverterFactory.create())
								.build();
		return retrofit.create(KakaoMapService.class);
	}
}