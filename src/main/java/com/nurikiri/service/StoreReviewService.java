package com.nurikiri.service;

import java.security.Principal;
import java.util.List;

import com.nurikiri.domain.Criteria;
import com.nurikiri.domain.StoreReviewVO;

public interface StoreReviewService {
//	public void register(ReviewVO review) throws Exception;
	
	public StoreReviewVO get(Long rno);
	
//	public boolean modify(ReviewVO review) throws Exception;
	
	public boolean remove(Long rno);
	
	public List<StoreReviewVO> getList(Criteria cri, Principal principal);
	
	public int getTotal(Criteria cri);
	
}