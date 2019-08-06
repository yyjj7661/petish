package com.community.petish.mypet.post.dto.response;

import java.util.List;

import lombok.Getter;
import lombok.ToString;

@ToString
@Getter
public class MypetPostSummaryList {

	private Integer pageNum;
	private List<MypetPostSummary> posts;
	
	public MypetPostSummaryList(Integer pageNum, List<MypetPostSummary> posts) {
		this.pageNum = pageNum;
		this.posts = posts;
	}
	
}
