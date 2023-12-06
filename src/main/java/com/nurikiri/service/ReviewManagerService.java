package com.nurikiri.service;

import java.security.Principal;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.nurikiri.domain.Criteria;
import com.nurikiri.domain.ReviewManagerVO;
import com.nurikiri.domain.ReviewVO;

public interface ReviewManagerService {
//	public void register(ReviewVO review) throws Exception;
	
	public ReviewManagerVO get(Long rno);
	
//	public boolean modify(ReviewVO review) throws Exception;
	
	public boolean remove(Long rno);
	
	public List<ReviewManagerVO> getList(Criteria cri, Principal principal);
	
	public int getTotal(Criteria cri);
	
	public List<ReviewManagerVO> myReviewList(Criteria cri, Principal principal);
	
	public int reviewTotal(Criteria cri, Principal principal);
}