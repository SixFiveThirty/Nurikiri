package com.nurikiri.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/managers")
public class AdminController {
	
	//관리자화면
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() {
		return "managers/main";
	}
	

}
