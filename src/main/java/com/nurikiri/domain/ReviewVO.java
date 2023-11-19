package com.nurikiri.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewVO {
	private Long rno;
	private Long sno;

	private String writer;
	private String content;
	private Date regDate;
	private Date updateDate;
}
