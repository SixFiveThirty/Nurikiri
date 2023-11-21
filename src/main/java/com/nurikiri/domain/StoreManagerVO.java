package com.nurikiri.domain;

import java.util.Date;

import lombok.Data;

@Data
public class StoreManagerVO {
	
	private Long sno;
	
	private String title; // 가맹점명		

	private Date regDate; // 등록일자
	
	private String isDeleted; //가맹점 운영 여부
}
