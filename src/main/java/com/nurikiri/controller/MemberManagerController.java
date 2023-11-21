package com.nurikiri.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nurikiri.domain.Criteria;
import com.nurikiri.domain.PageDTO;
import com.nurikiri.service.MemberService;
import com.nurikiri.service.ReviewManagerService;
import com.nurikiri.service.StoreService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/managers/member")
@AllArgsConstructor
public class MemberManagerController {
	
	@Autowired
	private MemberService service;

	@GetMapping("/list")
	public void list(@ModelAttribute("cri") Criteria cri, Principal principal, Model model) {

		log.info("list");
		int total = service.getTotal(cri);

		model.addAttribute("list", service.getList(cri, principal));
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		//model.addAttribute("memberAuth", )
	}

}
