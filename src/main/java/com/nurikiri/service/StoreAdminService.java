package com.nurikiri.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.nurikiri.domain.Criteria;
import com.nurikiri.domain.StoreAdminVO;

@Service
public interface StoreAdminService {
 //가맹점 리스트
	List<StoreAdminVO> storeAdminList(Criteria cri);

//	StoreAdminVO get(Long sno);
}
