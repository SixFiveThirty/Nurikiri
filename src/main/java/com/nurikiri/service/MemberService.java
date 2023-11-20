package com.nurikiri.service;

import java.io.IOException;

import com.nurikiri.domain.MemberVO;

import org.springframework.web.multipart.MultipartFile;


public interface MemberService {

	public MemberVO get(String username);
	
	public void register(MemberVO member, MultipartFile avatar) throws IOException;
	
	public void modify(MemberVO member, MultipartFile avatar) throws IOException;

	public boolean checkPassword(MemberVO member);
	
}
