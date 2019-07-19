package com.community.petish.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.community.petish.mypage.dto.MessageResponseDTO;
import com.community.petish.mypage.service.MessageService;
import com.community.petish.mypage.service.QuestionService;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/mypage/api/*")
public class MypageRESTController {
	@Autowired
	private QuestionService questionServiceImpl;
	

	@Autowired
	private MessageService messageServiceImpl;
	
	//메세지 세부내용 보기
	@GetMapping(value="/message/{id}",
			produces = {MediaType.APPLICATION_XML_VALUE,
						MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<MessageResponseDTO> getQuestionDetail(
		@PathVariable("id") int id){
		return new ResponseEntity<MessageResponseDTO>(messageServiceImpl.getMessageDetail(id),HttpStatus.OK);
	}
}
