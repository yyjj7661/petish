package com.community.petish.mypet.post.service;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.community.petish.mypet.post.dto.response.MypetPostDetailResponse;
import com.community.petish.mypet.post.dto.response.MypetPostSummaryList;

public interface MypetPostService {

	Long savePost(MultipartHttpServletRequest request) throws Exception;
	
	MypetPostDetailResponse getPost(Long postId);
	
}
