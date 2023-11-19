package com.nurikiri.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.nurikiri.service.MailServiceImpl;

@Controller
@RequestMapping("/security")
public class MailServiceRestController {
	@Autowired
	MailServiceImpl mailService;
	
	//127.0.0.1:8080/security/test?email
	@PostMapping("/test")
	public String mailConfirm(@RequestParam("email") String email) throws Exception {
		String code = mailService.sendSimpleMessage(email);
		System.out.println("사용자에게 발송한 인증코드 ==> " + code);
		return code;
	}
}