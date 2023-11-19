package com.nurikiri.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nurikiri.domain.Criteria;
import com.nurikiri.domain.PageDTO;
import com.nurikiri.service.StoreAdminService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/managers/store")
@AllArgsConstructor
public class StoreAdminController {
	@Autowired
	private StoreAdminService service;

	@GetMapping("/list")
	public void list(@ModelAttribute("cri") Criteria cri, Model model) {
		log.info("list: " + cri);
		model.addAttribute("list", service.storeAdminList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, 123)); //나중에 123 -> total로 수정한다고 하심.
	}
}


	


/*
 * @Controller public class StoreAdminController {
 * 
 * @Autowired private StoreAdminService storeAdminservice;
 * 
 * @RequestMapping("/managers/store") public ModelAndView storeAdminList()
 * throws Exception{ ModelAndView mv = new ModelAndView("/list");
 * 
 * List<StoreAdminVO> list = storeAdminservice.storeAdminList();
 * mv.addObject("list", list);
 * 
 * return mv;
 * 
 * } }
 */

