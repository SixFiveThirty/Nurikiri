package com.nurikiri.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nurikiri.domain.ReviewVO;
import com.nurikiri.mapper.ReviewMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ReviewServiceImpl implements ReviewService {
	private ReviewMapper mapper;

	@Transactional(rollbackFor = Exception.class)
	@Override
	public void register(ReviewVO review) throws Exception {
		log.info("register...." + review);

		mapper.insertSelectKey(review);
		Long rno = review.getRno();

	}

	@Override
	public ReviewVO get(Long rno) {
		log.info("get....." + rno);
		ReviewVO review = mapper.read(rno);

		return review;
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public boolean modify(ReviewVO review) throws Exception {
		log.info("modify........" + review);

		int result = mapper.update(review);
		Long rno = review.getRno();

		return result == 1;
	}

	@Override
	public boolean remove(Long rno) {
		log.info("remove...." + rno);
		return mapper.delete(rno) == 1;
	}

	@Override
	public List<ReviewVO> getList() {
		log.info("getList......");
		return mapper.getList();
	}

}
