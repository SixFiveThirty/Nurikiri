package com.nurikiri.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nurikiri.domain.ReviewVO;
import com.nurikiri.mapper.ReviewMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	private ReviewMapper Mapper;
	
	@Override
	public void reviewCreate(ReviewVO vo) {
		
		log.info("(service)reviewCreate..........");
		
		if(vo.getImageList() == null || vo.getImageList().size() <= 0) {
			return;
		}
		
		Mapper.create(vo);
		
		vo.getImageList().forEach(image ->{
			
			image.setRno(vo.getRno());
			Mapper.imageUpdate(image);
			
		});
	}
	
	
}
