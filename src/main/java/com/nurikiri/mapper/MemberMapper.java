package com.nurikiri.mapper;

import com.nurikiri.domain.AuthVO;
import com.nurikiri.domain.MemberVO;
import com.nurikiri.domain.UpdateInfVO;

public interface MemberMapper {
public MemberVO read(String username);
	
	public void insert(MemberVO member);
	
	public void insertAuth(AuthVO auth);

	public void updateInf(UpdateInfVO vo);
}
