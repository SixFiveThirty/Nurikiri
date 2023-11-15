package com.nurikiri.domain;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Repository
public class StoreAdminDAOImpl implements StoreAdminDAO {

	@Inject
	private SqlSession sqlsession;
	
	@Override
	public List<StoreAdminVO> storeAdminList(StoreAdminVO storeAdminVO){
		return sqlsession.selectList("storeAdminList", storeAdminVO);
	}
}
