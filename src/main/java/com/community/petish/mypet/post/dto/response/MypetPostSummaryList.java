package com.community.petish.mypet.post.dto.response;

import java.util.List;

import lombok.Getter;
import lombok.ToString;

@ToString
@Getter
public class MypetPostSummaryList {

	private List<MypetPostSummary> posts;
	
	public MypetPostSummaryList(List<MypetPostSummary> posts) {
		this.posts = posts;
	}
	
}
