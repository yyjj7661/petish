package com.community.petish.mypet.post.dto.response;

import lombok.Getter;
import lombok.ToString;

@ToString
@Getter
public class MypetPostDetailResponse {

	private Long postId;
	private String title;
	private String content;
	private String image;
	private Long likeCount;
	private Long commentCount;
	
}
