package com.nurikiri.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.LinkedHashMap;
import java.util.Map;

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

import com.nurikiri.domain.BoardVO;
import com.nurikiri.domain.Criteria;
import com.nurikiri.domain.PageDTO;
import com.nurikiri.service.BoardService;
import com.nurikiri.service.BoardServiceImpl;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board")
@AllArgsConstructor
@Log4j
public class BoardController {
	
	@Autowired
	private BoardService service;

	@PostMapping("/uploadFormAction")
	public void uploadFormPost(MultipartFile[] uploadFile, Model model) {
		
	}
	
	/*게시판 목록 페이지 접속*/
	@GetMapping("/list")
	public void list(@ModelAttribute("cri") Criteria cri,Principal principal, Model model) {

		log.info("list");
		int total = service.getTotal(cri);

		model.addAttribute("list", service.getList(cri,principal));
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
	}
	
	/*게시판 등록 페이지 등록*/
	@GetMapping("/register")
	public void register(@ModelAttribute("board") BoardVO board) {
	}
	
	@PostMapping("/register")
	public String register(BoardVO board, MultipartFile thumbnail, Errors errors) throws Exception{
		
		log.info("register: " + board);
		if(errors.hasErrors()) {
			log.error("에러남" + errors);
			return "board/register";
		}
		
		service.register(board, thumbnail);
		return "redirect:/board/list";
		
		
	}
	
	/*게시판 수정 페이지 접속*/
	@GetMapping({ "/get", "/modify" })
	public void get(
			@RequestParam("bno") Long bno,
			@ModelAttribute("cri") Criteria cri,
			Principal principal,
			Model model) {

		log.info("/get or modify");
		model.addAttribute("board", service.get(bno,principal));
	}

	@PostMapping("/modify")
	public String modify(
			@Valid @ModelAttribute("board") BoardVO board,
			@ModelAttribute("cri") Criteria cri,
			MultipartFile thumbnail,
			Errors errors) throws Exception {
		log.info("modify: " + board);
			
		if(errors.hasErrors()) {
			return "board/modify";
		}
		
		service.modify(board, thumbnail);
		return "redirect:" + cri.getLinkWithSno("/board/get", board.getBno());
	}
	
	@PostMapping("/remove")
	public String remove(
			@RequestParam("bno") Long bno, 
			@ModelAttribute("cri") Criteria cri,
			RedirectAttributes rttr) {
	
		log.info("remove");
		if (service.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/board/list";

	}
	
	@ModelAttribute("searchTypes")
	public Map<String, String> searchTypes() {
		Map<String, String> map = new LinkedHashMap<String, String>();
		map.put("T", "게시글 제목");
		map.put("W", "작성자");

		return map;
	}
}
