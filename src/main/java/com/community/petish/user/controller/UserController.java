package com.community.petish.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.community.petish.mypage.service.DefaultService;
import com.community.petish.mypage.service.MessageService;
import com.community.petish.mypage.service.QuestionService;
import com.community.petish.mypage.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private QuestionService questionServiceImpl;
	
	@Autowired
	private MessageService messageServiceImpl;
	
	@Autowired
	private DefaultService defaultServiceImpl;
	
	@Autowired
	private UserService userServiceImpl;
	
	@RequestMapping("/kakaomap")
	public String kakaomap() {
		return "commons/kakaomap";
	}
	
	@RequestMapping("/member/detail/{user_id}")
	public String memberDetail(@PathVariable("user_id") long user_id, Model model, HttpSession session) {
		//로그인 여부 확인
		if(session.getAttribute("user_id")==null) {
			return "petish/loginpage";
		}else {
			model.addAttribute("member", userServiceImpl.findUser(user_id));
			return "petish/mypage/member_detail";
		}
	}

}
