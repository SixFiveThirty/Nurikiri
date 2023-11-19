package com.nurikiri.domain;

import java.util.Date;

import lombok.Data;

@Data
public class StoreAdminVO {
	
	private Long sno;
	
	private String title; // 가맹점명		

	private Date regDate; // 등록일자
	
	private int is_deleted; //가맹점 운영 여부


}
