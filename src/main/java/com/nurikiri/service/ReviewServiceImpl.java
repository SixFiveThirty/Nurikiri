package com.nurikiri.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.nurikiri.domain.Criteria;
import com.nurikiri.domain.ReviewVO;
import com.nurikiri.mapper.ReviewMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ReviewServiceImpl implements ReviewService {
	private ReviewMapper mapper;

	@Override
	public ReviewVO get(Long rno) {
		log.info("get....." + rno);
		ReviewVO review = mapper.read(rno);

		return review;
	}

	@Override
	public boolean remove(Long rno) {
		log.info("remove...." + rno);
		return mapper.delete(rno) == 1;
	}

	@Override
	public List<ReviewVO> getList(Criteria cri) {
		log.info("get List with citeria: " + cri);
		return mapper.getListWithPaging(cri);
	}

}
