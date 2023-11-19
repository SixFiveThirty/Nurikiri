package com.nurikiri.mapper;

import java.util.List;

import com.nurikiri.domain.Criteria;
import com.nurikiri.domain.StoreAdminVO;

public interface StoreAdminMapper {
	public List<StoreAdminVO> storeAdminList();
	
	public List<StoreAdminVO> getListWithPaging(Criteria cri);
	
	
	
	

}
