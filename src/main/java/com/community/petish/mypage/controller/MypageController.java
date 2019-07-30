package com.community.petish.mypage.controller;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.community.petish.mypage.dto.MessageResponseDTO;
import com.community.petish.mypage.dto.MyWritingsDTO;
import com.community.petish.mypage.dto.QuestionRequestDTO;
import com.community.petish.mypage.dto.QuestionResponseDTO;
import com.community.petish.mypage.dto.Criteria;
import com.community.petish.mypage.dto.WritingPageDTO;
import com.community.petish.mypage.dto.Writings_CommentedDTO;
import com.community.petish.mypage.dto.Writings_LikedDTO;
import com.community.petish.mypage.service.DefaultService;
import com.community.petish.mypage.service.MessageService;
import com.community.petish.mypage.service.QuestionService;
import com.community.petish.mypage.service.UserService;
import com.community.petish.user.dto.UserModifyPictureDTO;
import com.community.petish.user.dto.UserModifyRequestDTO;
import com.community.petish.user.dto.UserResponseDTO;

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
	
	@Autowired
	private UserService userServiceImpl;
	
	@RequestMapping("/")
	public String mypage(Model model, HttpSession session, Criteria cri) {
		int user_id = 1;
		//세션이 널이면 로그인페이지로 이동 (if)
		UserResponseDTO user = userServiceImpl.findUser(user_id);
		model.addAttribute("user", user);
		return "petish/mypage/default";
	}
	
	@RequestMapping(value="/modifyForm/{user_id}")
	public String modifyForm(@PathVariable("user_id") long user_id, Model model, HttpSession session) {
		//로그인 여부 확인
		if(session.getAttribute("user_id")==null) {
			return "petish/loginpage";
		}else {
		UserResponseDTO dto = userServiceImpl.findUser(user_id);
		log.info(dto);
		model.addAttribute("dto", dto);
			return "petish/mypage/info_modify_form";}
	}
	
	@RequestMapping(value="/modifyUserInfo", method = {RequestMethod.POST})
	public String modifyUserInfo(UserModifyRequestDTO dto, Model model) {
		log.info("수정"+dto);
		userServiceImpl.modifyUserInfo(dto);
		return "redirect:./";
	}

	
	//question start
	@RequestMapping("/question/list")
	public String questionList(Model model, HttpSession session) {
		//로그인 여부 확인
		if(session.getAttribute("user_id")==null) {
			return "petish/loginpage";
		}else {
		int user_id = (int)session.getAttribute("user_id");
		log.info(user_id);
		ArrayList<QuestionResponseDTO> list = questionServiceImpl.getQuestionList(user_id);
		int amount = questionServiceImpl.getUndeleted(user_id);
		model.addAttribute("amount", amount);
		model.addAttribute("list",list);
		return "petish/mypage/question_list";
		}
	}

	@RequestMapping("/question/insert")
	public String insertQuestion(QuestionRequestDTO dto, HttpSession session) {
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
		//로그인 여부 확인
		if(session.getAttribute("user_id")==null) {
			return "petish/loginpage";
		}else {
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
	}
	
	@RequestMapping("/message/delete")
	public String messageDelete(int id) {
		messageServiceImpl.deleteMessage(id);
		log.info(id);
		return "redirect:./list";	
	}
	//message end
	
	
	@RequestMapping(value="/uploadFormAction", method = {RequestMethod.POST})
	public String uploadFormAction(MultipartFile[] picture, Model model, long id) {
		String uploadFolder = "C:\\Users\\bit-user\\Desktop\\PetCommunity\\petish\\src\\main\\webapp\\resources\\img";
		log.info("여기까지?1");
		for (MultipartFile multipartFile : picture) {
			log.info("name:"+multipartFile.getOriginalFilename());
			log.info("size:"+multipartFile.getSize());
			
			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());
			try {
				multipartFile.transferTo(saveFile);
				UserModifyPictureDTO dto = new UserModifyPictureDTO();
				dto.setId(id);
				dto.setPicture(multipartFile.getOriginalFilename());
				int res = userServiceImpl.modifyPicture(dto);
				log.info("res"+res);
			}catch(Exception e) {
				log.error(e.getMessage());
			}
			model.addAttribute("user_id", id);
		}
		return "redirect:./modifyForm";	
	}
}
