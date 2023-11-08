package com.nurikiri.domain;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

import org.springframework.security.core.authority.SimpleGrantedAuthority;

import lombok.Data;

@Data
public class MemberVO {

	@NotBlank(message="필수 항목 입니다.")
	private String username;
	
	@NotBlank(message="필수 항목 입니다.")
	private String password;
	
	@NotBlank(message="필수 항목 입니다.")
	private String password2;
	
	@NotBlank(message="필수 항목 입니다.")
	private String name;
	
	@NotBlank(message="필수 항목 입니다.")
	private String jumin;
	
	@NotBlank(message="필수 항목 입니다.")
	@Email(message="이메일 형식에 맞지 않습니다.")
	private String email;
	
	private Date regDate;
	private Date updateDate;
	
	private List<AuthVO> authList;
	
	public Collection<SimpleGrantedAuthority> getAuthorites(){
		List<SimpleGrantedAuthority> authorities = new ArrayList<>();
		
		for(AuthVO auth: authList) {
			authorities.add(new SimpleGrantedAuthority(auth.getAuth()));
		}
		
		return authorities;
	}
}
