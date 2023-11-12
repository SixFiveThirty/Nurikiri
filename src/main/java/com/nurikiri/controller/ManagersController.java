package com.nurikiri.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/managers")
@AllArgsConstructor
public class ManagersController {
	
	@GetMapping("/managers_list")
	public void list(Model model) {
		log.info("managers_list");
	}
	
}
