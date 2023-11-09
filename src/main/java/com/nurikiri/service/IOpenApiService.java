package com.nurikiri.service;

import java.util.List;

import com.nurikiri.domain.OpenApiDTO;

public interface IOpenApiService {
	
	List<OpenApiDTO> getOpenApiInfo(OpenApiDTO pDTO) throws Exception;

}
