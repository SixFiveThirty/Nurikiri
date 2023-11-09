package com.nurikiri.domain;

<<<<<<< HEAD
import org.springframework.web.util.UriComponentsBuilder;

=======
>>>>>>> 24c8a7c263c4976a50d26d2237a62439fb231ffb
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class Criteria {
	private int pageNum;
	private int amount;
<<<<<<< HEAD
	private String type; // 검색 대상
	private String keyword; // 검색어

	public Criteria() {
		this(1, 10);
	}

=======
	
	public Criteria() {
		this(1,10);
	}
	
>>>>>>> 24c8a7c263c4976a50d26d2237a62439fb231ffb
	public Criteria(int pageNum) {
		this(pageNum, 10);
	}

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
<<<<<<< HEAD

	public int getOffset() {
		return (pageNum - 1) * amount;
	}

	public String[] getTypeArr() {
		return type == null ? new String[] {} : // 빈 배열 리턴
				type.split(""); // 한글자 단위로 분리된 배열 리턴
	}

	public String getLink(String base, int pageNum) {
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath(base).queryParam("pageNum", pageNum)
				.queryParam("amount", amount).queryParam("type", type).queryParam("keyword", keyword);
		return builder.toUriString();
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

	public String getLinkWithSno(String base, Long sno) {
		return getLink(base, pageNum) + "&sno=" + sno;
	}
=======
	
	public int getOffset() {
		return (pageNum - 1) * amount;
	}
>>>>>>> 24c8a7c263c4976a50d26d2237a62439fb231ffb
}
