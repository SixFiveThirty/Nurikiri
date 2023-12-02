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
import com.nurikiri.domain.PageDTO;
import com.nurikiri.service.ReviewManagerService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/managers/review")
@AllArgsConstructor
public class ReviewManagerController {
	@Autowired
	private ReviewManagerService service;

	@GetMapping("/list")
	public void list(@ModelAttribute("cri") Criteria cri, Principal principal, Model model) {
		log.info("list: " + cri);
		int total = service.getTotal(cri);
		
		model.addAttribute("list", service.getList(cri, principal));
		model.addAttribute("pageMaker", new PageDTO(cri, total)); // 나중에 123 -> total로 수정한다고 하심.
	}

	@GetMapping({ "/get" })
	public void get(@RequestParam("rno") Long rno, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("get");
		model.addAttribute("review", service.get(rno));		
	}

	@PostMapping("/remove")
	public String remove(@RequestParam("rno") Long rno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("remove...." + rno);

		if (service.remove(rno)) {
			rttr.addFlashAttribute("result", "success");
			rttr.addAttribute("pageNum", cri.getPageNum());
			rttr.addAttribute("amount", cri.getAmount());
			rttr.addAttribute("type", cri.getType());
			rttr.addAttribute("keyword", cri.getKeyword());
		}

		return "redirect: " + cri.getLink("/managers/review/list");
	}
}
