package com.nurikiri.domain;

import java.util.Date;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class StoreAdminVO {
	// @NotBlank(message = "필수항목입니다.")
		
		private Long sno;
		
		@NotBlank(message = "가맹점은 필수항목입니다.")
		private String title; // 가맹점명
		
		private String market; // 소속 시장

		@NotBlank(message = "주소는 필수항목입니다.")
		private String address; // 소재지

		@NotBlank(message = "취급 품목은 필수항목입니다.")
		private String item; // 취급 품목

		private boolean useRechargeCard; // 충전식카드
		
		private boolean useBill; // 지류 취급여부

		private boolean useMobile; // 모바일 취급여부

		@NotBlank(message = "가맹점 설명은 필수항목입니다.")
		private String content; // 가맹점 설명

		private String owner; // 사장님 이름
		
		@NotBlank(message = "전화번호는 필수항목입니다.")
		private String phone; // 전화 번호

		@NotBlank(message = "등록일자는 필수항목입니다.")
		private Date regDate; // 등록일자
		private Date updateDate; //작성일

}
