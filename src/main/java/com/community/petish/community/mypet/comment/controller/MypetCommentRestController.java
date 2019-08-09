package com.community.petish.community.mypet.comment.controller;

import javax.servlet.http.HttpServletRequest;

import com.community.petish.community.mypet.comment.dto.response.MypetCommentListResponse;
import com.community.petish.community.mypet.comment.service.MypetCommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/api/mypet/comments")
public class MypetCommentRestController {

	@Autowired
  MypetCommentService mypetCommentService;
	
	@PostMapping
	public void saveComment(HttpServletRequest request) {
		
		Long commentId = mypetCommentService.saveComment(request);
		
	}
	
	@GetMapping(value = "/post/{postId}", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE } )
	public MypetCommentListResponse getCommentsByPostId(@PathVariable("postId") Long postId) {
		
		MypetCommentListResponse mypetCommentListResponse = mypetCommentService.getCommentsByPostId(postId);
		
		return mypetCommentListResponse;
		
	}
}
