package com.nurikiri.mapper;

import java.util.List;

import com.nurikiri.domain.Criteria;
import com.nurikiri.domain.ReviewVO;

public interface ReviewMapper {
	public List<ReviewVO> getList();
	
	public List<ReviewVO> getListWithPaging(Criteria cri);
	
	public void insert(ReviewVO review);
	
	public void insertSelectKey(ReviewVO review);
	
	public ReviewVO read(Long rno);
	
	public int delete(Long rno);
	
	public int update(ReviewVO review);
	
}
