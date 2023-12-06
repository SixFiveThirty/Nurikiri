package com.nurikiri.service;

import java.security.Principal;
import java.util.List;

import org.springframework.stereotype.Service;

import com.nurikiri.domain.Criteria;
import com.nurikiri.domain.StoreReviewVO;
import com.nurikiri.mapper.StoreReviewMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class StoreReviewServiceImpl implements StoreReviewService {
	public static final String THUMBNAIL_UPLOAD_DIR = "/Users/hayoon/nurikiri_image/store_review";

	private StoreReviewMapper mapper;

	@Override
	public StoreReviewVO get(Long rno) {
		log.info("get....." + rno);
		StoreReviewVO review = mapper.read(rno);

		return review;
	}

	@Override
	public boolean remove(Long rno) {
		log.info("remove...." + rno);
		return mapper.delete(rno) == 1;
	}

	@Override
	public List<StoreReviewVO> getList(Criteria cri, Principal principal) {
		log.info("get List with citeria: " + cri);
		return mapper.getListWithPaging(cri);
	}
	
	@Override
	public int getTotal(Criteria cri) {
		log.info("get total count");

		return mapper.getTotalCount(cri);
	}

}
