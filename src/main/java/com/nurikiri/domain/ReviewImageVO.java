package com.nurikiri.domain;

import lombok.Data;

@Data
public class ReviewImageVO {
	private String uploadPath;
	
	private String uuid;
	
	private String fileName;
	
	private int storeId;
	
	private int userId;
}
