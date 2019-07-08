package com.community.petish.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypage/*")
public class MypageController {

	@RequestMapping("/")
	public String mypage() {
		return "petish/mypage/default";
	}
	
	@RequestMapping("/modifyForm")
	public String modifyForm() {
		return "petish/mypage/info_modify_form";
	}
	
	@RequestMapping("/message")
	public String messageList() {
		return "petish/mypage/message_list";
	}
	
	@RequestMapping("/question/list")
	public String questionList() {
		return "petish/mypage/question_list";
	}
	
	@RequestMapping("/question/detail")
	public String questionDetail() {
		return "petish/mypage/question_detail";
	}
	
}
