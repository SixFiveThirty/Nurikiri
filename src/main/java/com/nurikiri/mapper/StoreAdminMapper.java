package com.nurikiri.mapper;

import java.util.List;

import com.nurikiri.domain.Criteria;
import com.nurikiri.domain.EditorVO;
import com.nurikiri.domain.StoreAdminVO;

public interface StoreAdminMapper {
	public List<StoreAdminVO> getListWithPaging(Criteria cri);
	
	public StoreAdminVO read(Long sno);
}
