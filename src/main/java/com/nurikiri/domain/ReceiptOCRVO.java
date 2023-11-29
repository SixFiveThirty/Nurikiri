package com.nurikiri.domain;

import lombok.Data;
import lombok.extern.log4j.Log4j;

@Data
public class ReceiptOCRVO {
	private String salesTime;
	
	private String storeName;
	
	private String storeAddress;
	
	private String sumPrice;
	
	private Long sno;
	
	private String userName;
}
