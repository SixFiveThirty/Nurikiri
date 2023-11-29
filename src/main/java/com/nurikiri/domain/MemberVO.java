package com.nurikiri.domain;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import org.springframework.security.core.authority.SimpleGrantedAuthority;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.extern.log4j.Log4j;

//@AllArgsConstructor
//@Builder
@Data
@Log4j
public class MemberVO {
	
	@NotBlank(message="필수 항목 입니다.")
	@Size(min = 4, message = "4글자 이상이어야 합니다.")
	private String username;
	
	@NotBlank(message="필수 항목 입니다.")
	private String password;
	
	@NotBlank(message="필수 항목 입니다.")
	private String confirmedPassword;
	
	@NotBlank(message="필수 항목 입니다.")
	private String name;
	
	//생년월일로 변경..
	@NotBlank(message="필수 항목 입니다.")
	private String jumin;
	
	@NotBlank(message="필수 항목 입니다.")
	@Email(message="이메일 형식에 맞지 않습니다.")
	private String email;
	
	@NotBlank(message="필수 항목 입니다.")
	private String phone;
	
	private String imgSrc;

	private Date regDate;
	private Date updateDate;
	
	private List<AuthVO> authList;
	private String auth;
	
	private String isDeleted;
	
	public Collection<SimpleGrantedAuthority> getAuthorites(){
		List<SimpleGrantedAuthority> authorities = new ArrayList<>();

		for(AuthVO auth: authList) {
			authorities.add(new SimpleGrantedAuthority(auth.getAuth()));
			this.auth = auth.getAuth();
		}
		
		return authorities;
	}
}
