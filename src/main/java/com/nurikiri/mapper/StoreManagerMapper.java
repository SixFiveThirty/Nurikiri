package com.nurikiri.mapper;

import java.util.List;

import com.nurikiri.domain.Criteria;
import com.nurikiri.domain.StoreManagerVO;

public interface StoreManagerMapper {
	
	public StoreManagerVO read(Long sno);
	
	public List<StoreManagerVO> getListWithPaging(Criteria cri);
	
	
	
	

}
