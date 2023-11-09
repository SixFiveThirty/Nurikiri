package com.nurikiri.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.nurikiri.domain.MemberVO;
import com.nurikiri.mapper.MemberMapper;
import com.nurikiri.security.domain.CustomUser;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService {
	
	@Autowired
	private MemberMapper mapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) 
			throws UsernameNotFoundException {
		
		log.warn("Load User by Username: " + username);
		
		MemberVO vo = mapper.read(username);
		if(vo == null) {
			log.warn(username + "은 없는 id입니다.");
			throw new UsernameNotFoundException(username + "은 없는 id입니다."); // () < 이 예외의 오류 메세지
		}
		
		log.warn("user vo: " + vo);
		return new CustomUser(vo);
	}

}
