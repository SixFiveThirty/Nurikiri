package com.nurikiri.domain;

import java.util.Date;
import java.util.List;

import com.nurikiri.domain.kakaomap.Local;

import lombok.Data;

@Data
public class StoreVO {
	// @NotBlank(message = "필수항목입니다.")

	private Long sno;

	private String title; // 가맹점명

	private String market; // 소속 시장

	private String address; // 소재지

	private String item; // 취급 품목

	private boolean useRechargeCard; // 충전식카드

	private boolean useBill; // 지류 취급여부

	private boolean useMobile; // 모바일 취급여부

	private String content; // 가맹점 설명

	private String owner; // 사장님 이름

	private String phone; // 전화 번호

	private Date regDate; // 등록일자

	private Date updateDate;

	List<Local> locals;

	private String imgSrc;

	private int storeBookmarks; // 즐겨찾기 수

	private Boolean myStoreBookmark; // 즐겨찾기 여부
	
	private String reviewCount; // 리뷰 수
	
	private float avgRate; // 가맹점 평점
}
