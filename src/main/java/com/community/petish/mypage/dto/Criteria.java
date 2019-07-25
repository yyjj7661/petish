package com.community.petish.mypage.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	private int pageNum;
	private int amount;
	private long user_id;
	
	public Criteria() {
		this(1,10,0);
	}
	public Criteria(int pageNum, int amount, long user_id) {
		this.pageNum = pageNum;
		this.amount = amount;
		this.user_id = user_id;
	}
}
