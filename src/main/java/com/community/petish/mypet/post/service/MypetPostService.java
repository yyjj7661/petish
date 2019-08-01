package com.community.petish.mypet.post.service;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.community.petish.mypet.post.dto.response.MypetPostDetailResponse;
import com.community.petish.mypet.post.dto.response.MypetPostLikeListResponse;
import com.community.petish.mypet.post.dto.response.MypetPostSummaryList;

public interface MypetPostService {

	Long savePost(MultipartHttpServletRequest request) throws Exception;
	
	MypetPostSummaryList getPosts();
	
	MypetPostDetailResponse getPost(Long postId);
	
	Boolean getIsLikePressedOnPost(Long postId, HttpSession session);
	
	MypetPostLikeListResponse getLikes(Long postId);
	
	Long pressLikeOnPost(Long postId, HttpSession session);
	
}
