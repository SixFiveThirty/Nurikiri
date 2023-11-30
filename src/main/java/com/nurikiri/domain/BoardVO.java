package com.nurikiri.domain;

import java.util.Date;
import java.util.List;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class BoardVO {
	
	private Long bno; //게시판 번호
	
	@NotBlank(message="제목은 필수 항목입니다.")
	private String title; //게시판 제목
	
	@NotBlank(message="내용은 필수 항목입니다.")
	private String content; //게시판 내용
	
	private String writer; //게시판 작가
	
	List<BoardAttachmentVO> attaches;
	
	private Date regDate; //등록 날짜

	private Date updateDate; //수정날짜
}
