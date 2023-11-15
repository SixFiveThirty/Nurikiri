package com.nurikiri.service;

import java.util.List;

import org.springframework.stereotype.Service;
import com.nurikiri.domain.StoreAdminVO;
import com.nurikiri.mapper.StoreAdminMapper;

@Service
public class StoreAdminServiceImpl implements StoreAdminService{
	
	@Override
	public List<StoreAdminVO> storeAdminList() throws Exception{
		return StoreAdminMapper.selectStoreAdminList();
	}

}
