package com.nurikiri.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.nurikiri.domain.Criteria;
import com.nurikiri.domain.StoreManagerVO;

@Service
public interface StoreManagerService {

	 //가맹점 리스트
	//public StoreManagerVO get(Long sno);
	
	public List<StoreManagerVO> storeManagerList(Criteria cri);
	
	public void update(Long sno, String isDeleted);
	
	public int getTotal(Criteria cri);
}
