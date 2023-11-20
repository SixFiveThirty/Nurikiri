package com.nurikiri.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.nurikiri.domain.Criteria;
import com.nurikiri.domain.StoreManagerVO;
import com.nurikiri.mapper.StoreManagerMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class StoreManagerServiceImpl implements StoreManagerService{
	
	private StoreManagerMapper mapper;
	
	@Override
	public List<StoreManagerVO> storeManagerList(Criteria cri) {
		log.info("get List" + cri);
		return mapper.getListWithPaging(cri);
	}

	/*
	 * @Override public StoreAdminVO get(Long sno) { StoreAdminVO storeAdmin =
	 * mapper.read(sno); return storeAdmin; }
	 */
	
	}

	
	
	

