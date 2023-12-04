package com.nurikiri.mapper;

import java.util.List;

import com.nurikiri.domain.Criteria;
import com.nurikiri.domain.StoreReviewVO;

public interface StoreReviewMapper {
	public List<StoreReviewVO> getList();
	
	public List<StoreReviewVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
	public void insert(StoreReviewVO review);
	
	public void insertSelectKey(StoreReviewVO review);
	
	public StoreReviewVO read(Long rno);
	
	public int delete(Long rno);
	
	public int update(StoreReviewVO review);
	
	public List<StoreReviewVO> getListWithMypagePaging(Criteria cri);
	
}
