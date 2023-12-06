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
		List<StoreManagerVO> list = mapper.getListWithPaging(cri);
		return list;
	}
	
	@Override
	public void update(Long sno, String isDeleted){
		log.info("update");
		 mapper.update(sno, isDeleted);
	}
	
	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");

		return mapper.getTotalCount(cri);
	}
}

	
	
	

