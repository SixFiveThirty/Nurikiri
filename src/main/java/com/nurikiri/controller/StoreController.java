package com.nurikiri.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.Principal;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
import com.nurikiri.domain.PageDTO;
import com.nurikiri.domain.StoreVO;
import com.nurikiri.service.OcrService;
import com.nurikiri.service.StoreService;
import com.nurikiri.service.StoreServiceImpl;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnails;

@Controller
@Log4j
@RequestMapping("/store")
@AllArgsConstructor
public class StoreController {

	@Autowired
	private StoreService service;

	@Autowired
	private OcrService ocrService;

	@GetMapping("/receipt_popup")
	public void receiptPopup(@RequestParam("sno") Long sno, HttpSession session) {
		log.info("sno값은? : " + sno);
		log.info("Popup Test");
		session.setAttribute("sno", sno);
	}

	@PostMapping("/receipt_popup")
	public String receiptPopup(MultipartFile receipt, Principal principal, Long sno, HttpServletRequest request) throws Exception {
		log.info("받은 파일? : " + receipt);
		try {
			String extractedText = ocrService.extractTextFromImage(receipt, principal, sno, request);

            log.info("성공 : " + extractedText);

            return extractedText;
		} catch (IOException e) {
			e.printStackTrace();
			return "Error processing the file.";
		}
	}

	@PostMapping("/uploadFormAction")
	public void uploadFormPost(MultipartFile[] uploadFile, Model model) {

	}

	@GetMapping("/list")
	public void list(@ModelAttribute("cri") Criteria cri, Principal principal, Model model) {
		System.out.println("vo:" + cri);
		log.info("list");
		int total = service.getTotal(cri);

		model.addAttribute("list", service.getList(cri, principal));
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	@GetMapping("/register")
	public void register(@ModelAttribute("store") StoreVO store) {
	}

	@PostMapping("/register")
	public String register(StoreVO store, MultipartFile thumbnail, Errors errors) throws Exception {

		log.info("register: " + store);
		if (errors.hasErrors()) {
			log.error("에러남" + errors);
			return "store/register";
		}

		service.register(store, thumbnail);
		return "redirect:/store/list";
	}

	@GetMapping({ "/get", "/modify", "/get_test2" })
	public void get(@RequestParam("sno") Long sno, @ModelAttribute("cri") Criteria cri, Principal principal,
			Model model, @ModelAttribute("state") String state) {
		log.info("/get or modify");
		model.addAttribute("store", service.get(sno, principal));
	}

	@PostMapping("/modify")
	public String modify(@Valid @ModelAttribute("store") StoreVO store, @ModelAttribute("cri") Criteria cri,
			MultipartFile thumbnail, Errors errors) throws Exception {
		log.info("modify: " + store);

		if (errors.hasErrors()) {
			return "store/modify";
		}

		service.modify(store, thumbnail);
		return "redirect:" + cri.getLinkWithSno("/store/get", store.getSno());
	}

	@PostMapping("/remove")
	public String remove(@RequestParam("sno") Long sno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {

		log.info("remove");
		if (service.remove(sno)) {
			rttr.addFlashAttribute("result", "success");
		}

		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		return "redirect:/store/list";

	}

	@ModelAttribute("searchTypes")
	public Map<String, String> searchTypes() {
		Map<String, String> map = new LinkedHashMap<String, String>();
		map.put("T", "상호명");
		map.put("M", "시장명");
		map.put("A", "지역명");

		return map;
	}

	@GetMapping("/image/{size}/{sno}")
	@ResponseBody
	public void thumbnail(@PathVariable("size") String size, @PathVariable("sno") Long sno, Principal principal,
			HttpServletResponse response) throws IOException {
		StoreVO store = service.get(sno, principal);

		File src = new File(store.getImgSrc());
		if (!src.exists()) {
			src = new File(StoreServiceImpl.THUMBNAIL_UPLOAD_DIR, "image_prepare.png");
		}
		log.warn(src);
		response.setHeader("Content-Type", "image/png");
		if (size.equals("thumbnail")) {
			Thumbnails.of(src).size(250, 250).toOutputStream(response.getOutputStream());
		} else {
			Thumbnails.of(src).size(300, 300).toOutputStream(response.getOutputStream());
		}
	}

}
