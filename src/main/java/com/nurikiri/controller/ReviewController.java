package com.nurikiri.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nurikiri.domain.EditorVO;
import com.nurikiri.domain.ReviewVO;
import com.nurikiri.service.ReviewService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/managers/review")
@AllArgsConstructor
public class ReviewController {
	@Autowired
	private ReviewService service;

	@GetMapping("/list")
	public void list(Model model) {
		log.info("list");
		model.addAttribute("list", service.getList());
	}

	@GetMapping("/register")
	public void register(@ModelAttribute("review") ReviewVO review) {
		log.info("register");
	}

	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("review") ReviewVO review, Errors errors, RedirectAttributes rttr)
			throws Exception {

		log.info("register: " + review);
		service.register(review);
		rttr.addFlashAttribute("result", review.getRno());
		return "redirect:/manager/review/list";
	}

	@GetMapping({ "/get", "/modify" })
	public void get(Model model) {
		log.info("get");
	}

	@PostMapping("/modify")
	public String modify(@Valid @ModelAttribute("review") ReviewVO review, Errors errors, RedirectAttributes rttr)
			throws Exception {
		log.info("modify: " + review);

		if (service.modify(review)) {
			rttr.addFlashAttribute("result", "success");
		}

		return "redirect:/manager/review/get";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("rno") Long rno, RedirectAttributes rttr) {
		log.info("remove...." + rno);
		
		if(service.remove(rno)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/manager/review/list";
	}
}
