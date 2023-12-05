package com.nurikiri.mapper;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.nurikiri.domain.ReviewImageVO;
import com.nurikiri.domain.ReviewVO;

public interface ReviewMapper {
	
	List<ReviewVO> readAll(Long sno);

	ReviewVO get(Long rno);

	void create(ReviewVO vo);

	void update(ReviewVO vo);

	void delete(Long rno);
	
	/* 이미지 등록 */
	public void imageUpdate(ReviewImageVO vo, MultipartFile file);
}
