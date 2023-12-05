package com.nurikiri.service;

import org.springframework.web.multipart.MultipartFile;

import com.nurikiri.domain.ReviewImageVO;
import com.nurikiri.domain.ReviewVO;

public interface ReviewService {

	public void reviewCreate(ReviewVO vo);

	public void fileUpload(ReviewImageVO vo, MultipartFile file);	
}
