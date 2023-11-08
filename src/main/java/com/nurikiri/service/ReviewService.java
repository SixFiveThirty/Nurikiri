package com.nurikiri.service;

import java.util.List;

import com.nurikiri.domain.ReviewVO;

public interface ReviewService {
	public void register(ReviewVO review) throws Exception;
	
	public ReviewVO get(Long rno);
	
	public boolean modify(ReviewVO review) throws Exception;
	
	public boolean remove(Long rno);
	
	public List<ReviewVO> getList();
}