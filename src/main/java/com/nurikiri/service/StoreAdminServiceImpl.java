package com.nurikiri.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.nurikiri.domain.StoreAdminDAO;
import com.nurikiri.domain.StoreAdminVO;
import com.nurikiri.mapper.StoreAdminMapper;

import lombok.RequiredArgsConstructor;

@Service
public class StoreAdminServiceImpl implements StoreAdminService{
	
	@Autowired
	private StoreAdminDAO dao;
	
	@Override
	public List<StoreAdminVO> storeAdminList() throws Exception{
		return StoreAdminMapper.selectStoreAdminList();
	}

}
