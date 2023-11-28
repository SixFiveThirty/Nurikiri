package com.nurikiri.domain;

import java.util.Date;
import lombok.Data;

@Data
public class BoardVO {
	
	private Long bno; //게시판 번호
	
	private String title; //게시판 제목
	
	private String content; //게시판 내용
	
	private String writer; //게시판 작가
	
	private Date regDate; //등록 날짜

	private Date updateDate; //수정날짜
	
	private String imgSrc;

	
	
	
}
