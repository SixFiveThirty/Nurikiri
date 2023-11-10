package com.nurikiri.domain;

import lombok.Data;

@Data
public class OpenApiDTO {
	private int sno;
	private String title;
	private String market;
	private String address;
	private String item;
	private Boolean use_recharge_card;
	private Boolean use_bill;
	private Boolean use_mobile;
	private int registerDate;
	
	public OpenApiDTO() {
	}
	
	public OpenApiDTO(String title, String market, String address, String item, Boolean use_recharge_card, Boolean use_bill, Boolean use_mobile, int registerDate) {
		super();
		this.title = title;
		this.market = market;
		this.address = address;
		this.item = item;
		this.use_recharge_card = use_recharge_card;
		this.use_bill = use_bill;
		this.use_mobile = use_mobile;
		this.registerDate =  registerDate;
	}
	
	
	
	
	
	
}
