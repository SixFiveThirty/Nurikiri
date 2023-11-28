package com.nurikiri.domain;

import lombok.Data;
import lombok.extern.log4j.Log4j;

@Data
@Log4j
public class ReceiptOCRVO {
	private String salesTime;
	
	private String storeName;
	
	private String storeAddress;
	
	private Long sumPrice;
	
	private String imgSrc;
	
	private Long sno;
	
	private String userName;
	
	private Long rno;
}
