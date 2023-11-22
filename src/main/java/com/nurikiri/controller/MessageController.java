package com.nurikiri.controller;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.nurikiri.service.MemberService;

@RestController
@RequestMapping("/api")
public class MessageController {
	@Autowired
	private MemberService service;
	
	@GetMapping("/check/sendSMS")
	@ResponseBody
	public String sendSMS(@RequestParam String phone) {
		Random rand = new Random();
		String numStr = "";
		for(int i = 0; i<4; i++) {
			String ran = Integer.toString(rand.nextInt(10));
			numStr+=ran;
		}
		System.out.println("수신자 번호 : " + phone);
		System.out.println("인증번호 : " + numStr);
		service.certifiedPhoneNumber(phone, numStr);
		return numStr;
	}
	
	@PostMapping("/check/authNum")
	public String authNum(@RequestBody String authNum) {
		
		
		return authNum;
	}
}
