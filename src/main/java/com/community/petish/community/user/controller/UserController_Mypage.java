package com.community.petish.community.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.community.petish.community.mypage.service.DefaultService;
import com.community.petish.community.mypage.service.MessageService;
import com.community.petish.community.mypage.service.QuestionService;
import com.community.petish.community.mypage.service.UserService_Mypage;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class UserController_Mypage {
	
	@Autowired
	private QuestionService questionServiceImpl;
	
	@Autowired
	private MessageService messageServiceImpl;
	
	@Autowired
	private DefaultService defaultServiceImpl;
	
	@Autowired
	private UserService_Mypage userServiceImpl;
	
	@RequestMapping("/kakaomap")
	public String kakaomap() {
		return "commons/kakaomap";
	}
	
	@RequestMapping("/member/detail/{user_id}")
	public String memberDetail(@PathVariable("user_id") Long user_id, Model model, HttpSession session) {
		//로그인 여부 확인
		if(session.getAttribute("user_id")==null) {
			return "petish/loginpage";
		}else {
			model.addAttribute("member", userServiceImpl.findUser(user_id));
			return "petish/mypage/member_detail";
		}
	}
	

}
