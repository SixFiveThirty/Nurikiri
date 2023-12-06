package com.nurikiri.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nurikiri.domain.Criteria;
import com.nurikiri.domain.EditorVO;
import com.nurikiri.domain.PageDTO;
import com.nurikiri.service.EditorService;
import com.nurikiri.service.EditorServiceImpl;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnails;

@Controller
@Log4j
@RequestMapping("/recommend/editor")
@AllArgsConstructor
public class EditorController {
	@Autowired
	private EditorService service;
	
	@GetMapping({"/get", "/modify", "/get_test"})
	public void get(
		@RequestParam("eno") Long eno,
		@ModelAttribute("cri") Criteria cri,
		Model model
	)
	{
		log.info("/get or /modify");
		model.addAttribute("editor", service.get(eno));
	}
	
	@GetMapping("/list")
	public void list (
			@ModelAttribute("cri") Criteria cri,
			Model model) {
		log.info("list: " + cri);
		int total = service.getTotal(cri);
		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, total));//임의로 123 요청
	}
	
	@GetMapping("/register")
	public void register(@ModelAttribute("editor") EditorVO editor) {
		log.info("register");
	}
	
	@PostMapping("/register")
	public String register(
			@Valid @ModelAttribute("editor") EditorVO editor,
			Errors errors,
			MultipartFile thumbnail) throws Exception{
		log.info("register: " + editor);
		if(errors.hasErrors()) {
			log.error("에러남" + errors);
			return "recommend/editor/register";
		}
		
		service.register(editor, thumbnail);
		
		return "redirect:/recommend/editor/list";
	}
	
	@PostMapping("/modify")
	public String modify(
		@Valid @ModelAttribute("editor") EditorVO editor,
		Errors errors,
		MultipartFile thumbnail,
		@ModelAttribute("cri") Criteria cri) throws Exception {
		log.info("modify: " + editor);
		
		if(errors.hasErrors()) {
			return "recommend/editor/modify";
		}
		
		service.modify(editor, thumbnail);
		
		return "redirect:" + cri.getLinkWithEno("/recommend/editor/get", editor.getEno());
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("eno") Long eno, RedirectAttributes rttr) {
		log.info("remove...." + eno);
		
		if(service.remove(eno)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/recommed/editor/list";
	}
	
	@GetMapping("/image/{size}/{eno}")
	@ResponseBody
	public void thumbnail(@PathVariable("size") String size,@PathVariable("eno") Long eno, HttpServletResponse response) throws IOException {
		EditorVO editor = service.get(eno);
		
		File src = new File(editor.getImgSrc());
		if(!src.exists()) {
			src = new File(EditorServiceImpl.THUMBNAIL_UPLOAD_DIR, "image_prepare.png");
		}
		log.warn(src);
		response.setHeader("Content-Type", "image/jpg");
		if(size.equals("thumbnail")) {
			Thumbnails.of(src).size(1350, 800).toOutputStream(response.getOutputStream());
		} else {
			Thumbnails.of(src).size(1350, 800).toOutputStream(response.getOutputStream());
		}
	}
}
