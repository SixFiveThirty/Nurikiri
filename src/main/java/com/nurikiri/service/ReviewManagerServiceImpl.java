package com.nurikiri.service;

import java.security.Principal;
import java.util.List;

import org.springframework.stereotype.Service;

import com.mysql.cj.callback.UsernameCallback;
import com.nurikiri.domain.Criteria;
import com.nurikiri.domain.ReviewManagerVO;
import com.nurikiri.domain.ReviewVO;
import com.nurikiri.mapper.ReviewManagerMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ReviewManagerServiceImpl implements ReviewManagerService {


	private ReviewManagerMapper mapper;

	@Override
	public ReviewManagerVO get(Long rno) {
		log.info("get....." + rno);
		ReviewManagerVO review = mapper.read(rno);

		return review;
	}

	@Override
	public boolean remove(Long rno) {
		log.info("remove...." + rno);
		return mapper.delete(rno) == 1;
	}

	@Override
	public List<ReviewManagerVO> getList(Criteria cri, Principal principal) {
		log.info("get List with citeria: " + cri);
		return mapper.getListWithPaging(cri);
	}
	
	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");

		return mapper.getTotalCount(cri);
	}

	@Override
	public List<ReviewManagerVO> myReviewList(Criteria cri, Principal principal) {
		log.info("myReviewList with citeria: " + cri);
		String username = principal.getName();
		cri.setAmount(8);
		return mapper.getListWithMypagePaging(username, cri);
	}

	@Override
	public int reviewTotal(Criteria cri, Principal principal) {
		log.info("get bookmarkTotal count");
		String username = principal.getName();

		return mapper.myReviewTotalCount(username, cri);
	}
	

}
