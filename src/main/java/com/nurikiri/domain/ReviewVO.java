package com.nurikiri.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class ReviewVO {
	private Long rno;
	private Long sno;
	private String writer;
	private String content;
	private Date regDate;
	private Date updateDate;
	
	private int rate;
	
	private String fileName;
	private String uploadPath;
	private String uuid;
	
	private List<ReviewImageVO> imageList;
}
