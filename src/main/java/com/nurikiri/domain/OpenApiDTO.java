package com.nurikiri.domain;

import lombok.Data;

@Data
public class OpenApiDTO {
	private int sno;
	private String title;
	private String content;
	private String owner;
	private String address;
	private int registerDate;
	private int updateDate;
	
	public OpenApiDTO() {
		super();
	}
	
	public OpenApiDTO(int sno, String title, String content, String owner, String address, int registerDate, int updateDate) {
		super();
		this.sno = sno;
		this.title = title;
		this.content = content;
		this.owner = owner;
		this.address = address;
		this.registerDate =  registerDate;
		this.updateDate = updateDate; 
	}
	
	
	
	
	
	
}
