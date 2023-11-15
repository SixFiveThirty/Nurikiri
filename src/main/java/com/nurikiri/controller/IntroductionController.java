package com.nurikiri.controller;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nurikiri.domain.IntroductionVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/introduction")
@AllArgsConstructor
public class IntroductionController {
	@GetMapping({"/get", "/modify", "/test"})
	public void get() {
		log.info("Welcome to GET OR MODIFY Page");
	}
	
	@PostMapping("/modify")
	public String modify(
			@Valid @ModelAttribute("introduction") IntroductionVO introductioin,
			Errors errors) throws Exception{
		return "redirect:/introduction/get";
	}
}
