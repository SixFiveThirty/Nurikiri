package com.nurikiri.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

	@GetMapping({ "/get"})
	public void get(Model model) {
		log.info("get");
	}

	@PostMapping("/remove")
	public String remove(@RequestParam("rno") Long rno, RedirectAttributes rttr) {
		log.info("remove...." + rno);
		
		if(service.remove(rno)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/managers/review/list";
	}
}
