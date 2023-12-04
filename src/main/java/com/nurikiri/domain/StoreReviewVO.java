package com.nurikiri.domain;

import java.util.Date;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class StoreReviewVO {
	private Long rno;
	private Long sno;
		
	@NotBlank(message="내용은 필수 항목입니다.")
	private String content;
	
	@NotBlank(message="작성자는 필수 항목입니다.")
	private String writer;
	
	private Date regDate;
	
	private Date updateDate;
	
	private int rate;
}
