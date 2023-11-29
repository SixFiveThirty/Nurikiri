package com.nurikiri.service;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

import com.nurikiri.domain.AuthVO;
import com.nurikiri.domain.Criteria;
import com.nurikiri.domain.MemberVO;

import org.json.JSONObject;
import org.springframework.web.multipart.MultipartFile;


public interface MemberService {
	
	public MemberVO get(String username);
	
	public void register(MemberVO member, MultipartFile avatar) throws IOException;
	
	public void modify(MemberVO member, MultipartFile avatar) throws IOException;
	
	//--------------------------------------------------
	
	public List<MemberVO> getList(Criteria cri, Principal principal);
	
	public int getTotal(Criteria cri);
	
	public boolean remove(String username);

	public void certifiedPhoneNumber(String phone, String numStr);
	
	public void changeAuth(String username, String auth);
	
	public void changeState(String username, String isDeleted);
	
}
