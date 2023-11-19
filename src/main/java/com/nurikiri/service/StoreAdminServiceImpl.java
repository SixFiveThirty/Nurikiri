package com.nurikiri.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.nurikiri.domain.Criteria;
import com.nurikiri.domain.StoreAdminVO;
import com.nurikiri.mapper.StoreAdminMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class StoreAdminServiceImpl implements StoreAdminService{
	
	private StoreAdminMapper mapper;
	
	@Override
	public List<StoreAdminVO> storeAdminList(Criteria cri) {
		log.info("get List" + cri);
		return mapper.getListWithPaging(cri);
	}

	/*
	 * @Override public StoreAdminVO get(Long sno) { StoreAdminVO storeAdmin =
	 * mapper.read(sno); return storeAdmin; }
	 */
	
	}

	
	
	

