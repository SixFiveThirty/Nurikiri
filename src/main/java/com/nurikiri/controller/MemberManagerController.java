package com.nurikiri.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nurikiri.domain.Criteria;
import com.nurikiri.domain.MemberVO;
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
	}

	@PostMapping("/remove")
	public String remove(@RequestParam("username") String username, @ModelAttribute("cri") Criteria cri,
			RedirectAttributes rttr) {
		log.info("remove" + username);
		if (service.remove(username)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/managers/member/list" + cri.getLink();
	}

	@PostMapping("/changeAuth")
	public String changeAuth(@RequestParam("username") String username, @RequestParam("auth") String auth,
			@ModelAttribute("cri") Criteria cri,
			RedirectAttributes rttr) {
		log.info("changeAuth " + username + " auth: " + auth);
		
		service.changeAuth(username, auth);


		return "redirect:/managers/member/list" + cri.getLink();
	}
	
	@PostMapping("/changeState")
	public String changeState(@RequestParam("username") String username, @RequestParam("isDeleted") String isDeleted,
			@ModelAttribute("cri") Criteria cri,
			RedirectAttributes rttr) {
		log.info("changeState " + username + " isDeleted: " + isDeleted);
		
		service.changeState(username, isDeleted);


		return "redirect:/managers/member/list" + cri.getLink();
	}

}
