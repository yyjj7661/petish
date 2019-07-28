package com.community.petish.mypet.post.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.community.petish.mypet.post.dto.response.MypetPostDetailResponse;
import com.community.petish.mypet.post.dto.response.MypetPostSummaryList;
import com.community.petish.mypet.post.service.MypetPostService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/api/mypet/posts")
public class MypetPostRestController {
	
	@Autowired
	MypetPostService mypetPostService;
	
	@PostMapping
	public void savePost(MultipartHttpServletRequest request) throws Exception {
		log.info("mypet Post upload 요청");
		
		Long postId = mypetPostService.savePost(request);
		
	}
	
	@GetMapping(value="/{postId}", produces= { MediaType.APPLICATION_JSON_UTF8_VALUE })
	public MypetPostDetailResponse getPost(@PathVariable("postId") Long postId) {
		log.info("mypet post 요청 postId = {}", postId);
		
		MypetPostDetailResponse mypetPostDetailResponse = mypetPostService.getPost(postId);
		
		return mypetPostDetailResponse;
		
	}
	
}
