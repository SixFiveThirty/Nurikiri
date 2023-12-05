package com.nurikiri.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.nurikiri.domain.ReviewImageVO;
import com.nurikiri.domain.ReviewVO;
import com.nurikiri.mapper.ReviewMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReviewServiceImpl implements ReviewService {
	public static final String THUMBNAIL_UPLOAD_DIR = "/Users/jeonhayoon/upload/review";
	
	@Autowired
	private ReviewMapper mapper;
	
	@Override
	public void reviewCreate(ReviewVO vo) {
		
		log.info("(service)reviewCreate..........");
		
		mapper.create(vo);
	}
	
	@Override
	public void fileUpload(ReviewImageVO vo, MultipartFile file) {
		mapper.imageUpdate(vo, file);
	}
	
	
}
