package com.nurikiri.controller;

import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.nurikiri.service.MemberService;

import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping("/api")
public class MessageController {
	@Autowired
	private MemberService service;
	
	//RestAPI
	@GetMapping("/check/sendSMS")
	@ResponseBody
	public String sendSMS(@RequestParam String phone, HttpSession session) {
		Random rand = new Random();
		String numStr = "";
		for(int i = 0; i<4; i++) {
			String ran = Integer.toString(rand.nextInt(10));
			numStr+=ran;
		}
		session.setAttribute("phone", phone);
		session.setAttribute("numStr", numStr);
		service.certifiedPhoneNumber(phone, numStr);
		return numStr;
	}
	
	@PostMapping("/check/authNum")
	public String checkAuth(@RequestBody String numStr, HttpSession session) {
		String authNumber = (String) session.getAttribute("numStr");
		numStr = numStr.replace("\"", "");
		if(authNumber.equals(numStr)) {
			return "OK";
		} else {
			return "FAIL";
		}
	}
	
}

