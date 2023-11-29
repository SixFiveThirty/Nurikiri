package com.nurikiri.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.nurikiri.domain.Criteria;
import com.nurikiri.domain.ReviewManagerVO;

public interface ReviewManagerService {
//	public void register(ReviewVO review) throws Exception;
	
	public ReviewManagerVO get(Long rno);
	
//	public boolean modify(ReviewVO review) throws Exception;
	
	public boolean remove(Long rno);
	
	public List<ReviewManagerVO> getList(Criteria cri);
	
	public int getTotal(Criteria cri);
	
}