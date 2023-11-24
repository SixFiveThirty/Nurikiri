package com.nurikiri.domain;

import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.validation.constraints.NotBlank;

import com.nurikiri.domain.kakaomap.Local;

import lombok.Data;

@Data
public class EditorVO {
	private Long eno;
	
	@NotBlank(message="제목은 필수 항목입니다.")
	private String title;
	
	@NotBlank(message="내용은 필수 항목입니다.")
	private String content;
	
	@NotBlank(message="작성자는 필수 항목입니다.")
	private String writer;
	
	//가맹점명
	@NotBlank(message="가맹점명은 필수 항목입니다.")
	private String storeName;
	
	//소재지
	@NotBlank(message="소재지는 필수 항목입니다.")
	private String address;
	
	@NotBlank(message="링크는 필수 항목입니다.")
	private String link;
	
	@NotBlank(message="품목은 필수 항목입니다.")
	private String item;
	
	@NotBlank(message="시장은 필수 항목입니다.")
	private String market;
	
	//전화번호
	private String phone;
	
	List<EditorAttachmentVO> attaches;
	
	private Date regDate;
	
	private Date updateDate;
	
	List<Local> locals;
	
	private String imgSrc;
}
