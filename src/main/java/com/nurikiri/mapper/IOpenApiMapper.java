package com.nurikiri.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.nurikiri.domain.OpenApiDTO;

@Mapper
public interface IOpenApiMapper {
	
	List<OpenApiDTO> getOpenApiInfo(OpenApiDTO pDTO) throws Exception;

}
