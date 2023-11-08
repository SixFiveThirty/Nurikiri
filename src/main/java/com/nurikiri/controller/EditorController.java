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
import com.nurikiri.service.EditorService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/recommend/editor")
@AllArgsConstructor
public class EditorController {
	@Autowired
	private EditorService service;
	
	@GetMapping({"/get", "/modify"})
	public void get(
//		@RequestParam("eno") Long eno,
		Model model
	)
	{
		log.info("/get or /modify");
//		model.addAttribute("editor", service.get(eno));
	}
	
	@GetMapping("/list")
	public void list (Model model) {
		log.info("list");
		model.addAttribute("list", service.getList());
	}
	
	@GetMapping("/register")
	public void register(@ModelAttribute("editor") EditorVO editor) {
		log.info("register");
	}
	
	@PostMapping("/register")
	public String register(
			@Valid @ModelAttribute("editor") EditorVO editor,
			Errors errors,
			RedirectAttributes rttr
	) throws Exception{
		log.info("register: " + editor);
		service.register(editor);
		rttr.addFlashAttribute("result", editor.getEno());
		return "redirect:/recommend/editor/list";
	}
	
	@PostMapping("/modify")
	public String modify(
		@Valid @ModelAttribute("editor") EditorVO editor,
		Errors errors,
		RedirectAttributes rttr
	) throws Exception {
		log.info("modify: " + editor);
		
		if(service.modify(editor)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/recommend/editor/get";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("eno") Long eno, RedirectAttributes rttr) {
		log.info("remove...." + eno);
		
		if(service.remove(eno)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/recomment/editor/list";
	}
}
