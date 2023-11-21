package com.nurikiri.controller;

import java.io.File;
import java.io.IOException;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.nurikiri.service.MemberService;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnails;

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

	@PostMapping("/signup") // 오버로딩
	public String signup(@Valid @ModelAttribute("member") MemberVO member, Errors errors, MultipartFile avatar)
			throws IOException {
		log.info(member);

		// 1. 비밀번호, 비밀번호 확인 일치 여부
		if (!member.getPassword().equals(member.getConfirmedPassword())) {
			// 에러 추가
			errors.rejectValue("confirmedPassword", "비밀번호 불일치", "비밀번호가 일치하지 않습니다."); // reject와 rejectValue의 차이? reject는
																						// 전역에러
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

	@GetMapping("/modify")
	public void modify(@ModelAttribute("member") MemberVO member) {

	}

	@PostMapping("/modify")
	public String modify(@Valid @ModelAttribute("member") MemberVO member, Errors errors, MultipartFile avatar)
			throws IOException {

		if (!member.getPassword().equals(member.getConfirmedPassword())) {
			log.warn("비밀번호 불일치 에러");
			errors.rejectValue("confirmedPassword", "비밀번호 불일치", "비밀번호 확인이 일치하지 않습니다.");
		}

		if (errors.hasErrors()) {
			log.warn("에러문구" + errors);
//					log.warn(errors.getFieldError());
			log.warn(errors.getAllErrors());
			return "security/modify";
		}

		// 회원 정보 수정
		service.modify(member, avatar);
		log.warn("service.modify 작동 확인");

		return "redirect:/security/profile";
	}

	@GetMapping("/signup_test")
	public void signup_test(@ModelAttribute("member") MemberVO member) {

	}

	@PostMapping("/signup_test") // 오버로딩
	public String signup_test(@Valid @ModelAttribute("member") MemberVO member, Errors errors, MultipartFile avatar)
			throws IOException {
		log.info(member);

		// 1. 비밀번호, 비밀번호 확인 일치 여부
		if (!member.getPassword().equals(member.getConfirmedPassword())) {
			// 에러 추가
			errors.rejectValue("confirmedPassword", "비밀번호 불일치", "비밀번호가 일치하지 않습니다."); // reject와 rejectValue의 차이? reject는
																						// 전역에러
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
			return "security/signup_test"; // 오류 발생시 다시 작성하라고 signup 페이지로 다시 보내기
		}

		// 유효성 검사 후 DB에 저장
		service.register(member, avatar);

		return "redirect:/"; //
	}
	
	@GetMapping("/check/sendSMS")
	@ResponseBody
	public String sendSMS(String phone) {
		Random rand = new Random();
		String numStr = "";
		for(int i = 0; i<4; i++) {
			String ran = Integer.toString(rand.nextInt(10));
			numStr+=ran;
		}
		
		System.out.println("수신자 번호 : " + phone);
		System.out.println("인증번호 : " + numStr);
		certificationService.certifiedPhoneNumber(phone, numStr);
		return numStr;
	}
}
