package com.community.petish.mypet.comment.dto.request;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@ToString
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class SaveMypetCommentParams {

	private Long commentId;
	private String content;
	private Long postId;
	private Long userId;
	
	public SaveMypetCommentParams(String content, Long postId, Long userId) {
		this.content = content;
		this.postId = postId;
		this.userId = userId;
	}
	
}
