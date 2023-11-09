package com.nurikiri.mapper;

import com.nurikiri.domain.AuthVO;
import com.nurikiri.domain.MemberVO;

public interface MemberMapper {
public MemberVO read(String username);
	
	public void insert(MemberVO member);
	
	public void insertAuth(AuthVO auth);
}
