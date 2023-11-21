package com.nurikiri.controller;

import java.security.Principal;
import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nurikiri.domain.Criteria;
import com.nurikiri.domain.PageDTO;
import com.nurikiri.domain.StoreVO;
import com.nurikiri.service.ClovaOcrService;
import com.nurikiri.service.StoreService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/store")
public class StoreController {

	@Autowired
	private StoreService service;
	
	private ClovaOcrService ocrservice;
	
	@GetMapping("/reviewpopup")
	public void reviewpopup() {
		log.info("reviewpopup");
	}
	
	@PostMapping("/uploadFormAction")
	public void uploadFormPost(MultipartFile[] uploadFile, Model model) {
		
	}
	
	

	@GetMapping("/list")
	public void list(@ModelAttribute("cri") Criteria cri,Principal principal, Model model) {

		log.info("list");
		int total = service.getTotal(cri);

		model.addAttribute("list", service.getList(cri,principal));
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
	}
		
	@GetMapping("/register")
	public void register(@ModelAttribute("store") StoreVO store) {
	}

	@PostMapping("/register")
	public String register(StoreVO store, RedirectAttributes rttr) {

		log.info("post register");

		service.register(store);
		rttr.addFlashAttribute("result", store.getSno());

		return "redirect:/store/list";
	}

	@GetMapping({ "/get", "/modify" })
	public void get(
			@RequestParam("sno") Long sno,
			@ModelAttribute("cri") Criteria cri,
			Principal principal,
			Model model) {

		log.info("/get or modify");
		model.addAttribute("store", service.get(sno,principal));
	}

	@PostMapping("/modify")
	public String modify(
			StoreVO store,
			@ModelAttribute("cri") Criteria cri,
			RedirectAttributes rttr) {
		log.info("modify");

		if (service.modify(store)) {
			rttr.addFlashAttribute("result", "success");

		}
		return "redirect:" + cri.getLinkWithSno("/store/get", store.getSno());
		//return "redirect:/store/get";

	}
	
	@PostMapping("/remove")
	public String remove(
			@RequestParam("sno") Long sno, 
			@ModelAttribute("cri") Criteria cri,
			RedirectAttributes rttr) {
	
		log.info("remove");
		if (service.remove(sno)) {
			rttr.addFlashAttribute("result", "success");
		}
//		return "redirect:/store/list" + cri.getLink();
		return "redirect:/store/list";

	}

	@ModelAttribute("searchTypes")
	public Map<String, String> searchTypes() {
		Map<String, String> map = new LinkedHashMap<String, String>();
		map.put("", "-- �˻������ --");
		map.put("T", "����");
		map.put("W", "�ۼ���");
		map.put("C", "����");
		map.put("TC", "����+����");
		map.put("TW", "����+�ۼ���");
		map.put("TWC", "����+�ۼ���+����");

		return map;
	}

}
