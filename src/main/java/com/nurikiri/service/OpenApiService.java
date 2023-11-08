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
	
	//����api ���� ��������
	@Override
	public List<OpenApiDTO> getOpenApiInfo(OpenApiDTO pDTO) throws Exception {

		log.info(this.getClass().getName() + ".getOpenApiInfo start!");
		
		//���� api ���� ��ȸ
		List<OpenApiDTO> rList = openApiMapper.getOpenApiInfo(pDTO);
		
		//������ ������ ���������� ���� ��ó��
		if(rList == null) {
			rList = new ArrayList<OpenApiDTO>();
		}
		
		log.info(this.getClass().getName() + ".getOpenApiInfo end !");
		return rList;
	}

}
