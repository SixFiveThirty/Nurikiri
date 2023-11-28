package com.nurikiri.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.nurikiri.domain.Criteria;
import com.nurikiri.domain.StoreVO;

public interface StoreMapper {

	public List<StoreVO> getList();
	
	public void insert(StoreVO store);
	
	public int update(StoreVO store);
	
	public int delete(Long sno);
	
	public StoreVO read(Long sno);
	
	public List<StoreVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
}