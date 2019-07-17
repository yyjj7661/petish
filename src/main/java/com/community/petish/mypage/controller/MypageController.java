package com.community.petish.mypage.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.community.petish.mypage.dto.QuestionRequestDTO;
import com.community.petish.mypage.dto.QuestionResponseDTO;
import com.community.petish.mypage.service.QuestionService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/mypage/*")
public class MypageController {


	@Autowired
	private QuestionService questionServiceImpl;
	
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
	public String questionList(Model model) {
		ArrayList<QuestionRequestDTO> list = questionServiceImpl.getQuestionList(1);
		model.addAttribute("list",list);
		return "petish/mypage/question_list";
	}
	
	
	@RequestMapping("/member/detail")
	public String memberDetail() {
		return "petish/mypage/member_detail";
	}

	@RequestMapping("/question/insert")
	public String insertQuestion(QuestionResponseDTO dto) {
		log.info(dto);
		QuestionResponseDTO dto2 = new QuestionResponseDTO();
		dto2.setUser_id(dto.getUser_id());
		dto2.setTitle(dto.getTitle());
		dto2.setContent(dto.getContent());
		dto2.setCategory_id(2);
		questionServiceImpl.insertQuestion(dto2);
		return "redirect:./list";
	}
	
	@RequestMapping("/question/delete")
	public String deleteQuestion(int id) {
		log.info(id);
		questionServiceImpl.deleteQuestion(id);
		return "redirect:./list";
	}
}
