package com.nurikiri.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.nurikiri.domain.AuthVO;
import com.nurikiri.domain.Criteria;
import com.nurikiri.domain.MemberVO;

public interface MemberMapper {
	public MemberVO read(String username);
	
	public void insert(MemberVO member);
	
	public void insertAuth(AuthVO auth);

	public void modify(MemberVO member);
	
	//--------------------------------------------------
	
	public List<MemberVO> getList();
	
	public int delete(String username);
	
	public List<MemberVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
	public void changeAuth(@Param("username") String username,@Param("auth") String auth);
	
	public void isDeleted(@Param("username") String username, @Param("isDeleted") String isDeleted);
	
}
