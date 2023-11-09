package com.nurikiri.controller;

import java.io.IOException;

import javax.validation.Valid;

import com.nurikiri.domain.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.nurikiri.service.MemberService;

import lombok.extern.log4j.Log4j;

@Log4j
@RequestMapping("/security")
@Controller
public class SecurityController {
	
	@Autowired
	private MemberService service;
	
	@GetMapping("/login")
	public void login() {
		log.info("login page");
	}
	
	@GetMapping("/signup")
	public void signup(@ModelAttribute("member") MemberVO member) {
		
	}
	
	@PostMapping("/signup") //오버로딩
	public String signup(
			@Valid @ModelAttribute("member") MemberVO member, Errors errors, MultipartFile avatar) throws IOException {
		log.info(member);
		
		//1. 비밀번호, 비밀번호 확인 일치 여부
		if(!member.getPassword().equals(member.getPassword2())) {
			// 에러 추가
			errors.rejectValue("password2", "비밀번호 불일치", "비밀번호가 일치하지 않습니다."); // reject와 rejectValue의 차이? reject는 전역에러 설정, 특정 필드에 대해서 에러 추가는 rejectValue
		}
		
		// 2. 아이디 중복 시
		if(errors.hasFieldErrors("username")) { //hasFieldErrors 특정 필드 내에서 오류 났을시 검사
			// DB에서 username을 검사
			if(service.get(member.getUsername()) != null) { // 중복일 경우
				errors.rejectValue("username", "아이디 중복", "이미 사용중인 ID입니다.");
			}
		}
		
		if(errors.hasFieldErrors()) {
			return "security/signup"; // 오류 발생시 다시 작성하라고 signup 페이지로 다시 보내기
		}
		
		// 유효성 검사 후 DB에 저장
		service.register(member, avatar);
		
		
		
		return "redirect:/"; // 
	}
	
	
	
	@GetMapping("/profile")
	public void profile() {
		
	}
}
