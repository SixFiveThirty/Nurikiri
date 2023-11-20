package com.nurikiri.service;

import java.util.List;


import com.nurikiri.domain.Criteria;
import com.nurikiri.domain.StoreManagerVO;


public interface StoreManagerService {

	 //가맹점 리스트
	//public StoreAdminVO get(Long sno);
	
	public List<StoreManagerVO> storeManagerList(Criteria cri);

	

}
