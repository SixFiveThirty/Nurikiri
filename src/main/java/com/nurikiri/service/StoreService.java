package com.nurikiri.service;

import java.util.List;

import com.nurikiri.domain.Criteria;
import com.nurikiri.domain.StoreVO;

public interface StoreService {
	
	public List<StoreVO> getList(Criteria cri);
	
	public void register(StoreVO store);
	
	public boolean modify(StoreVO store);

	public boolean remove(Long sno);
	
	public int getTotal(Criteria cri);
	
	public StoreVO get(Long no);
	
}