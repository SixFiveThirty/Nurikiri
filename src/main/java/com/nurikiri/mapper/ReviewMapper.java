package com.nurikiri.mapper;

import java.util.List;

import com.nurikiri.domain.ReviewVO;

public interface ReviewMapper {
	List<ReviewVO> readAll(Long sno);

	ReviewVO get(Long rno);

	void create(ReviewVO vo);

	void update(ReviewVO vo);

	void delete(Long rno);

}
