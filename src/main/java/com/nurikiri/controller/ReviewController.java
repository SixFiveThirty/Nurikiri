package com.nurikiri.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.nurikiri.domain.ReviewVO;
import com.nurikiri.mapper.ReviewMapper;

@RestController
@RequestMapping("/api/managers/{sno}/review")
public class ReviewController {
	@Autowired
	ReviewMapper mapper;

	@GetMapping("")
	public List<ReviewVO> readReviews(@PathVariable Long sno) {
		return mapper.readAll(sno);
	}

	@GetMapping("/{rno}")
	public ReviewVO readReview(@PathVariable Long sno, @PathVariable Long rno) {
		return mapper.get(rno);
	}

	@PostMapping("")
	public ReviewVO create(@RequestBody ReviewVO vo) {
		mapper.create(vo);
		return mapper.get(vo.getRno());
	}

	@PutMapping("/{rno}")
	public ReviewVO update(@PathVariable Long rno, @RequestBody ReviewVO vo) {
		System.out.println("==> " + vo);
		mapper.update(vo);
		
		return mapper.get(vo.getRno());
	}

	@DeleteMapping("/{rno}")
	public String delete(@PathVariable Long rno) {
		System.out.println("delete ==>" + rno);
		mapper.delete(rno);
		return "OK";
	}
}
