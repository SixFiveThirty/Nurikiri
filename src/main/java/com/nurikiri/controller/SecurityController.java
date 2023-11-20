package com.nurikiri.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import com.nurikiri.domain.MemberVO;

import com.nurikiri.service.MemberServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;

import com.nurikiri.service.MemberService;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnails;

@Log4j
@RequestMapping("/security")
@Controller
public class SecurityController {

	@Autowired
	private MemberService service;
	
	@Autowired
	private AuthenticationManager authenticationManager;

	@GetMapping("/login")
	public void login() {
		log.info("login page");
	}

	@GetMapping("/signup")
	public void signup(@ModelAttribute("member") MemberVO member) {

	}

	@PostMapping("/signup") // 오버로딩
	public String signup(@Valid @ModelAttribute("member") MemberVO member, Errors errors, MultipartFile avatar)
			throws IOException {
		log.info(member);

		// 1. 비밀번호, 비밀번호 확인 일치 여부
		if (!member.getPassword().equals(member.getConfirmedPassword())) {
			// 에러 추가
			errors.rejectValue("confirmedPassword", "비밀번호 불일치", "비밀번호가 일치하지 않습니다."); // reject와 rejectValue의 차이? reject는 전역에러
																				// 설정, 특정 필드에 대해서 에러 추가는 rejectValue
		}

		// 2. 아이디 중복 시
		if (errors.hasFieldErrors("username")) { // hasFieldErrors 특정 필드 내에서 오류 났을시 검사
			// DB에서 username을 검사
			if (service.get(member.getUsername()) != null) { // 중복일 경우
				errors.rejectValue("username", "아이디 중복", "이미 사용중인 ID입니다.");
			}
		}

		if (errors.hasFieldErrors()) {
			return "security/signup"; // 오류 발생시 다시 작성하라고 signup 페이지로 다시 보내기
		}

		// 유효성 검사 후 DB에 저장
		service.register(member, avatar);

		return "redirect:/"; //
	}

	@GetMapping("/avatar/{size}/{username}")
	@ResponseBody
	public void avata(@PathVariable("size") String size, @PathVariable("username") String username,
			HttpServletResponse response) throws IOException {

		File src = new File(MemberServiceImpl.AVATAR_UPLOAD_DIR, username + ".png");
		if (!src.exists()) {
			src = new File(MemberServiceImpl.AVATAR_UPLOAD_DIR, "unknown.png");
		}
		log.warn(src);
		response.setHeader("Content-Type", "image/png");

		if (size.equals("sm")) {
			Thumbnails.of(src).size(24, 24).toOutputStream(response.getOutputStream());

		} else {
			Thumbnails.of(src).size(250, 250).toOutputStream(response.getOutputStream());
		}
	}

	@GetMapping("/profile")
	public void profile() {
		
	}
	
	@GetMapping("/check_pwd")
	public void checkPassword(@ModelAttribute("member") MemberVO member) {
		
	}
	
	@PostMapping("/check_pwd")
	public String checkPassword(@Valid @ModelAttribute("member") MemberVO member, Errors errors) {
			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		
			 if (!passwordEncoder.matches(member.getConfirmedPassword(), member.getPassword())) {
			        log.warn("비밀번호 불일치 에러");
			        errors.rejectValue("confirmedPassword", "비밀번호 불일치", "비밀번호가 일치하지 않습니다.");
			        return "security/check_pwd";
			    }
		
		
		return "redirect:/security/modify";
	}
	
	@GetMapping("/modify")
	public void modify(@ModelAttribute("member") MemberVO member) {
		
	}
	
	@PostMapping("/modify")
	public String modify(@Valid @ModelAttribute("member") MemberVO member, Errors errors, MultipartFile avatar, HttpSession session) throws IOException {
				
				if (!member.getPassword().equals(member.getConfirmedPassword())) {
					log.warn("비밀번호 불일치 에러");
					errors.rejectValue("confirmedPassword", "비밀번호 불일치", "비밀번호 확인이 일치하지 않습니다.");
				}

				if (errors.hasErrors()) {
					log.warn("에러문구"+ errors);
					//log.warn(errors.getFieldError());
					log.warn(errors.getAllErrors());
					return "security/modify";
				}				
				
				
				// 회원 정보 수정
			    service.modify(member, avatar);
			    log.warn("service.modify 작동 확인");
			    
			    // 수정된 정보로 다시 로그인
			    Authentication authentication = authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(member.getUsername(),member.getPassword()));
			    SecurityContextHolder.getContext().setAuthentication(authentication);
			    
			    // 세션에도 업데이트
			    session.setAttribute(HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY, SecurityContextHolder.getContext());

			    
				
				return "redirect:/security/profile";
	}
}
