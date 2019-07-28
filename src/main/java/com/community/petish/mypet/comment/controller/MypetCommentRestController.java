package com.community.petish.mypet.comment.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.community.petish.mypet.comment.service.MypetCommentService;

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
	
}
