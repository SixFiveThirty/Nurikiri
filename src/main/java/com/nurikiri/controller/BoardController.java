package com.nurikiri.controller;
import java.security.Principal;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nurikiri.domain.BoardAttachmentVO;
import com.nurikiri.domain.BoardVO;
import com.nurikiri.domain.Criteria;
import com.nurikiri.domain.PageDTO;
import com.nurikiri.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@Log4j
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService service;

	@ModelAttribute("searchTypes")
	public Map<String, String> searchTypes() {
		Map<String, String> map = new LinkedHashMap<String, String>();
		map.put("", "-- 검색대상선택 --");
		map.put("T", "제목");
		map.put("W", "작성자");

		return map;
	}
	
	/*게시판 목록 페이지 접속*/ 
	@GetMapping("/list")
	public void list(@ModelAttribute("cri") Criteria cri, Model model) {

		log.info("list" + cri);
		int total = service.getTotal(cri);

		model.addAttribute("list", service.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		
	}
	
	/*게시판 등록 페이지 등록*/
	@GetMapping("/register")
	public void register(@ModelAttribute("board") BoardVO board) {
		log.info("register");
	}
	
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("board") BoardVO board, 
			Principal principal,
			Errors errors, List<MultipartFile>files, 
			RedirectAttributes rttr) throws Exception{
		
		if(errors.hasErrors()) {
			return "board/register";
		}
		
		service.register(board, files, principal.getName());
		rttr.addFlashAttribute("result",board.getBno());
	
		return"redirect:/board/list";
	}
	
	/*게시판 수정 페이지 접속*/
	@GetMapping({ "/get", "/modify" })
	public void get(
			@RequestParam("bno") Long bno,
			@ModelAttribute("cri") Criteria cri,
			Model model) {

		log.info("/get or modify");
    
		model.addAttribute("board", service.get(bno));
	}

	@PostMapping("/modify")
	public String modify(
			@Valid @ModelAttribute("board") BoardVO board, 
			Errors errors, List<MultipartFile> files,
			@ModelAttribute("cri") Criteria cri,
			RedirectAttributes rttr) throws Exception {
		log.info("modify: " + board);
			
		if(errors.hasErrors()) {
			return "board/modify";
		}
		
		if(service.modify(board, files)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:" + cri.getLinkWithBno("/board/get", board.getBno());
	}
	
	@PostMapping("/remove")
	public String remove(
			@RequestParam("bno") Long bno, 
			@ModelAttribute("cri") Criteria cri,
			RedirectAttributes rttr) {
	
		log.info("remove" + bno);
		if (service.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/board/list" + cri.getLink();

	}
	
	@GetMapping("/download/{no}")
	@ResponseBody
	public void download(@PathVariable("no") Long no, HttpServletResponse response) throws Exception{
		BoardAttachmentVO attach = service.getAttachment(no);
		attach.download(response);
	}
	
	@DeleteMapping("/remove/attach/{no}")
	@ResponseBody
	public String removeAttach(@PathVariable("no") Long no) throws Exception{
		service.removeAttachment(no);
		return "OK";
	}
	
	
}
