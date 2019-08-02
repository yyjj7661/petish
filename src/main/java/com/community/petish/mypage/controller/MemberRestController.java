package com.community.petish.mypage.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.community.petish.mypage.controller.MypageRESTController;
import com.community.petish.mypage.dto.Criteria;
import com.community.petish.mypage.dto.MyWritingsDTO;
import com.community.petish.mypage.dto.Writings_CommentedDTO;
import com.community.petish.mypage.dto.Writings_LikedDTO;
import com.community.petish.mypage.service.DefaultService;
import com.community.petish.mypage.service.MessageService;
import com.community.petish.mypage.service.QuestionService;
import com.community.petish.mypage.service.UserService_Mypage;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/user/api/*")
public class MemberRestController {
	
	@Autowired
	private QuestionService questionServiceImpl;
	@Autowired
	private MessageService messageServiceImpl;
	@Autowired
	private UserService_Mypage userServiceImpl;
	@Autowired
	private DefaultService defaultServiceImpl;

	//default
		//default-내가 쓴 글 리스트
		@GetMapping(value="/Writinglist/{member_id}",
				produces = {
						MediaType.APPLICATION_XML_VALUE,
						MediaType.APPLICATION_JSON_UTF8_VALUE})
		public ResponseEntity<List<MyWritingsDTO>> getWritingList(
					Criteria cri, @PathVariable("member_id") int member_id){
					log.info("Writinglist");
					cri.setUser_id(member_id);
					return new ResponseEntity<>(defaultServiceImpl.getMyWritingsWithPaging(cri), HttpStatus.OK);
				}
		
		//default-내가 댓글 쓴 글 리스트
		@GetMapping(value="/Commentedlist/{member_id}",
				produces = {
						MediaType.APPLICATION_XML_VALUE,
						MediaType.APPLICATION_JSON_UTF8_VALUE})
		public ResponseEntity<List<Writings_CommentedDTO>> getCommentedList(
					Criteria cri, @PathVariable("member_id") int member_id){
					log.info("Commentedlist");
					cri.setUser_id(member_id);
					return new ResponseEntity<>(defaultServiceImpl.getCommentedWithPaging(cri), HttpStatus.OK);
				}

		//default-내가 좋아요 한 글 리스트
		@GetMapping(value="/Likedlist/{member_id}",
				produces = {
						MediaType.APPLICATION_XML_VALUE,
						MediaType.APPLICATION_JSON_UTF8_VALUE})
		public ResponseEntity<List<Writings_LikedDTO>> getLikedList(
					Criteria cri, @PathVariable("member_id") int member_id){
					log.info("Likedlist");
					cri.setUser_id(member_id);
					return new ResponseEntity<>(defaultServiceImpl.getLikedWithPaging(cri), HttpStatus.OK);
				}
		
		//message
		
}
