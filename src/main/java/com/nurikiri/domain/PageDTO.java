package com.nurikiri.domain;

import lombok.Data;

@Data
public class PageDTO {
	private int startPage;	
	private int endPage;	
	private boolean prev;	
	private boolean next;	
	
	private int totalPage;	
	private int total;		
	
	private Criteria cri;	

	
	public PageDTO(Criteria cri, int total) {	
		this.cri = cri;
		this.total = total;	
		
		int amount = cri.getAmount();
		int page = cri.getPageNum();

		totalPage = (int)(Math.ceil((float)total / amount));
		endPage = (int)(Math.ceil(page / (double)amount)) * amount;	
		startPage = endPage - (amount - 1);

		int realEnd = (int)(Math.ceil((total * 1.0) / amount));
		if(realEnd < this.endPage) {
			endPage = realEnd;
		}
				
		prev = startPage > 1;
		next = endPage < realEnd;
	}	
}
