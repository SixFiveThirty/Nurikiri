package com.nurikiri.security.domain;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.nurikiri.domain.MemberVO;

import lombok.Getter;

@Getter
public class CustomUser extends User {
	private MemberVO member;
	
	public CustomUser(String username, String password, 
			Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}
	
	public CustomUser(MemberVO vo) {
		super(vo.getUsername(), vo.getPassword(), vo.getAuthorites());
		System.out.println(vo.getAuthorites());
		this.member = vo;
	}
}
