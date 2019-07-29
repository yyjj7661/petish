package com.community.petish.mypet.comment.service;

import javax.servlet.http.HttpServletRequest;

import com.community.petish.mypet.comment.dto.response.MypetCommentListResponse;

public interface MypetCommentService {

	Long saveComment(HttpServletRequest request);
	
	MypetCommentListResponse getCommentsByPostId(Long postId);
	
}
