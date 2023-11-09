package com.nurikiri.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nurikiri.domain.OpenApiDTO;
import com.nurikiri.mapper.IOpenApiMapper;

@Service("OpenApiService")
public class OpenApiService implements IOpenApiService {

	@Autowired
	private IOpenApiMapper openApiMapper;
	
	private Logger log = Logger.getLogger(this.getClass());
	
	//오픈api 정보 가져오기
	@Override
	public List<OpenApiDTO> getOpenApiInfo(OpenApiDTO pDTO) throws Exception {

		log.info(this.getClass().getName() + ".getOpenApiInfo start!");
		
		//참조형 변수는 오류방지를 위해 널처리
		List<OpenApiDTO> rList = openApiMapper.getOpenApiInfo(pDTO);
		
		//참조형 변수는 오류방지를 위해 널처리
		if(rList == null) {
			rList = new ArrayList<OpenApiDTO>();
		}
		
		log.info(this.getClass().getName() + ".getOpenApiInfo end !");
		return rList;
	}

}
