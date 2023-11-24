package com.nurikiri.controller;

import org.apache.log4j.chainsaw.Main;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/mypage")
@AllArgsConstructor
public class MypageController {
	
	@GetMapping("/main")
	public void main() {
		log.info("mypage_main page");
	}
	
	@GetMapping("/review")
	public void review() {
		log.info("mypage_review page");
	}
	
	@GetMapping("/favorit")
	public void favorit() {
		log.info("mypage_favorit page");
	}

}
