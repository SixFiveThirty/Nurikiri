package com.nurikiri.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/recommend")
@AllArgsConstructor
public class RecommendController {
	@GetMapping({"/editor/get", "/editor/modify"})
	public void editor() {
		log.info("get");
	}
	
	@PostMapping("/editor/modify")
	public String modify() {
		log.info("modify return");
		return "redirect:/recommend/editor/get";
	}
}
