package com.nurikiri.domain;

import java.util.Date;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class StoreVO {
	
	private int sno;
	
	@NotBlank(message = "가맹점명은 필수 사항?항목?입니다.")
	private String title;
	
	@NotBlank(message = "가맹점 설명은 필수 사항?항목?입니다.")
	private String content; //Description?
	
	@NotBlank(message = "가맹점주 이름은 필수 사항?항목?입니다.")
	private String owner;
	
	@NotBlank(message = "가맹점 주소는 사항?항목?입니다.")
	private String address;
	
	// 전통시장 전화 필수인가?
	//@NotBlank(message = "가맹점 전화번호는 사항?항목?입니다.")
	private String phone; // Tel?
	
	@NotBlank(message = "가맹점 등록일은 사항?항목?입니다.")
	private Date regDate; 
	
	private Date updataDate; // 수정 날짜
	
	

}
