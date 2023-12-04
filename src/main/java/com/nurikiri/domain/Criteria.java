package com.nurikiri.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class Criteria {
    private int pageNum;
    private int amount;
    private String type;
    private String keyword;
    private String sort;


	public Criteria() {
		this(1, 12);
	}

    public Criteria(int pageNum) {
        this(pageNum, 10);
    }

    public Criteria(int pageNum, int amount) {
        this.pageNum = pageNum;
        this.amount = amount;
    }

    public int getOffset() {
        return (pageNum - 1) * amount;
    }

    public String[] getTypeArr() {
        return type == null ? 
                        new String[] {} :     
                        type.split("");        
    
   }
    
    
    public String getLink() {
        return getLink("", pageNum);
    }

    public String getLink(int pageNum) {
        return getLink("", pageNum);
    }

    public String getLink(String base) {
        return getLink(base, pageNum);
    }


    public String getLink(String base, int pageNum) {

        UriComponentsBuilder builder = 
            UriComponentsBuilder.fromPath(base)
                .queryParam("pageNum", pageNum)
                .queryParam("amount", amount)
                .queryParam("type", type)
                .queryParam("keyword", keyword)
        		.queryParam("sort", sort);

        return builder.toUriString();
    }

    public String getLinkWithSno(String base, Long sno) {
        return getLink(base, pageNum) + "&sno=" + sno;
    }
    
    public String getLinkWithEno(String base, Long eno) {
        return getLink(base, pageNum) + "&eno=" + eno;
    }
    
    public String getLinkWithBno(String base, Long bno) {
        return getLink(base, pageNum) + "&bno=" + bno;
    }
    
    public String getLinkWithRno(String base, Long rno) {
        return getLink(base, pageNum) + "&rno=" + rno;
    }
}
