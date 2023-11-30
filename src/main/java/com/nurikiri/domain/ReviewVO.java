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
	
	private float rate;
	
	private int rate1;
	private int rate2;
	private int rate3;
	private int rate4;
	private int rate5;
	private int rate6;
	private int rate7;
	private int rate8;
	private int rate9;
	private int rate10;
}
