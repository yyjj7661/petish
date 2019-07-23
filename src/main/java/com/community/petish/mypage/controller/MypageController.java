package com.community.petish.mypage.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.community.petish.mypage.dto.MessageResponseDTO;
import com.community.petish.mypage.dto.MyWritingsDTO;
import com.community.petish.mypage.dto.QuestionRequestDTO;
import com.community.petish.mypage.dto.QuestionResponseDTO;
import com.community.petish.mypage.dto.Writings_CommentedDTO;
import com.community.petish.mypage.dto.Writings_LikedDTO;
import com.community.petish.mypage.service.DefaultService;
import com.community.petish.mypage.service.MessageService;
import com.community.petish.mypage.service.MessageServiceImpl;
import com.community.petish.mypage.service.QuestionService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/mypage/*")
public class MypageController {

	
	@Autowired
	private QuestionService questionServiceImpl;
	
	@Autowired
	private MessageService messageServiceImpl;
	
	@Autowired
	private DefaultService defaultServiceImpl;
	
	@RequestMapping("/")
	public String mypage(Model model, HttpSession session) {
		int user_id = 1;
		ArrayList<MyWritingsDTO> writingList = defaultServiceImpl.getMyWritings(user_id);
		model.addAttribute("writingList", writingList);
		ArrayList<Writings_CommentedDTO> writingCommented = defaultServiceImpl.getCommented(user_id);
		model.addAttribute("writingCommented", writingCommented);
		ArrayList<Writings_LikedDTO> writingLiked= defaultServiceImpl.getLiked(user_id);
		model.addAttribute("writingLiked", writingLiked);
		return "petish/mypage/default";
	}
	
	@RequestMapping("/modifyForm")
	public String modifyForm() {
		return "petish/mypage/info_modify_form";
	}
	
	@RequestMapping("/member/detail")
	public String memberDetail(long user_id, Model model) {
		ArrayList<MyWritingsDTO> writingList = defaultServiceImpl.getMyWritings(user_id);
		model.addAttribute("writingList", writingList);
		ArrayList<Writings_CommentedDTO> writingCommented = defaultServiceImpl.getCommented(user_id);
		model.addAttribute("writingCommented", writingCommented);
		ArrayList<Writings_LikedDTO> writingLiked= defaultServiceImpl.getLiked(user_id);
		model.addAttribute("writingLiked", writingLiked);
		return "petish/mypage/member_detail";
	}
	
	//question start
	@RequestMapping("/question/list")
	public String questionList(Model model, HttpSession session) {
		int user_id = (int)session.getAttribute("user_id");
		log.info(user_id);
		ArrayList<QuestionResponseDTO> list = questionServiceImpl.getQuestionList(user_id);
		int amount = questionServiceImpl.getUndeleted(user_id);
		model.addAttribute("amount", amount);
		model.addAttribute("list",list);
		return "petish/mypage/question_list";
	}

	@RequestMapping("/question/insert")
	public String insertQuestion(QuestionRequestDTO dto) {
		log.info(dto);
		QuestionRequestDTO dto2 = new QuestionRequestDTO();
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
	
	//question end

	//message start
	@RequestMapping("/message/list")
	public String messageList(Model model, HttpSession session) {
		int user_id = (int)session.getAttribute("user_id");
		log.info(user_id);
		ArrayList<MessageResponseDTO> receivedList = messageServiceImpl.getReceivedMessageList(user_id);
		int undeletedReceived = messageServiceImpl.getUndeletedReceived(user_id);
		ArrayList<MessageResponseDTO> sentList = messageServiceImpl.getSentMessageList(user_id);
		int undeletedSent = messageServiceImpl.getUndeletedSent(user_id);
		model.addAttribute("receivedList", receivedList);
		model.addAttribute("undeletedReceived", undeletedReceived);
		model.addAttribute("sentList", sentList);
		model.addAttribute("undeletedSent", undeletedSent);
		return "petish/mypage/message_list";
	}
	
	@RequestMapping("/message/delete")
	public String messageDelete(int id) {
		messageServiceImpl.deleteMessage(id);
		log.info(id);
		return "redirect:./list";	
	}
	//message end
	
	
}
