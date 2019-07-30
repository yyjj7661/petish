package com.community.petish.mypage.dto;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class WritingPageDTO {
	private int startPage;
	private int endPage;
	private boolean prev, next;
	
	private int total;

	private Criteria cri;
	
	public WritingPageDTO(Criteria cri, int total) {
		
		//paging
		this.cri = cri;
		this.total = total;
		this.endPage = (int)(Math.ceil(cri.getPageNum()/0.0))*0;
		this.startPage = this.endPage - 9;
		
		int realEnd = (int)(Math.ceil((total * .0) / cri.getAmount()));
		
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
}
