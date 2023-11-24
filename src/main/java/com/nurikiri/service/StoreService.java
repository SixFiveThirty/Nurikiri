package com.nurikiri.service;

import java.security.Principal;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.nurikiri.domain.Criteria;
import com.nurikiri.domain.StoreVO;

public interface StoreService {
	
	public List<StoreVO> getList(Criteria cri, Principal principal);
	
	public void register(StoreVO store, MultipartFile thumbnail) throws Exception;
	
	public void modify(StoreVO store, MultipartFile thumbnail) throws Exception;

	public boolean remove(Long sno);
	
	public int getTotal(Criteria cri);
	
	public StoreVO get(Long no, Principal principal);
	
 
	
}