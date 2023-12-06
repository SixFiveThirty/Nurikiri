package com.nurikiri.controller;

import java.security.Principal;

import javax.lang.model.element.ModuleElement;

import org.apache.log4j.chainsaw.Main;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nurikiri.domain.Criteria;
import com.nurikiri.domain.PageDTO;
import com.nurikiri.service.ReviewManagerService;
import com.nurikiri.service.StoreService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/mypage")
@AllArgsConstructor
public class MypageController {
	
	@Autowired
	private ReviewManagerService reviewservice;
	
	@Autowired
	private StoreService storeService;
	
	@GetMapping("/main")
	public void main() {
		log.info("mypage_main page");
	}
	
	@GetMapping("/reviews")
	public void review(@ModelAttribute("cri") Criteria cri, Principal principal, Model model) {
		log.info("mypage_review page");
		
		int total = reviewservice.reviewTotal(cri, principal);
		model.addAttribute("list", reviewservice.myReviewList(cri, principal));
		model.addAttribute("pageMaker", new PageDTO(cri, total)); // 나중에 123 -> total로 수정한다고 하심.
	}
	
	@GetMapping({ "/reviews/get" })
	public void get(@RequestParam("rno") Long rno, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("get");
		model.addAttribute("review", reviewservice.get(rno));		
	}
	
	
	@GetMapping("/bookmarks")
	public void favorit(@ModelAttribute("cri") Criteria cri,Principal principal, Model model) {
		int total = storeService.bookmarkTotal(cri,principal); 
		log.info("get : my_bookmarks page " + total);
		model.addAttribute("list", storeService.getBookMarks(cri, principal));
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	


}
