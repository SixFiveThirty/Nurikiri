package com.nurikiri.domain;

import java.util.Date;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class StoreVO {
	
	//@NotBlank(message = "필수항목입니다.")
	
	private Long sno;
	
	private String title; // 가맹점명
		
	private String market; // 소속 시장
	
	private String address; // 소재지
	
	private String item; // 취급 품목
	
	private boolean useRechargeCard; // 충전식카드
	
	private boolean useBill; // 지류 취급여부
		
	private boolean useMobile; // 모바일 취급여부
	
	private Date regDate; // 등록일자	
	
	
	
	private String content; //Description?
	
	private String owner;
	
	
	
	
	
	
	
	 
	private Date updataDate; // ���� ��¥
	
	

}