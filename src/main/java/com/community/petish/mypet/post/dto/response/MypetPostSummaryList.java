package com.community.petish.mypet.post.dto.response;

import java.util.List;

public class MypetPostSummaryList {

	private List<MypetPostSummary> posts;
	
	public MypetPostSummaryList(List<MypetPostSummary> posts) {
		this.posts = posts;
	}
	
}
