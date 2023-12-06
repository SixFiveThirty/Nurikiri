package com.nurikiri.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.nurikiri.domain.Criteria;
import com.nurikiri.domain.ReviewManagerVO;

public interface ReviewManagerMapper {
	public List<ReviewManagerVO> getList();
	
	public List<ReviewManagerVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
	public void insert(ReviewManagerVO review);
	
	public void insertSelectKey(ReviewManagerVO review);
	
	public ReviewManagerVO read(Long rno);
	
	public int delete(Long rno);
	
	public int update(ReviewManagerVO review);
	
	public List<ReviewManagerVO> getListWithMypagePaging(@Param("username") String username, @Param("cri") Criteria cri);
	
	public int myReviewTotalCount(@Param("username") String username, @Param("cri") Criteria cri);
}
