package com.nurikiri.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/introduction")
@AllArgsConstructor
public class IntroductionController {
	@GetMapping("/get")
	public void get() {
		log.info("Welcome to GET OR MODIFY Page");
	}
}
