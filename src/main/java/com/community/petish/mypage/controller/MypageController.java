package com.community.petish.mypage.controller;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.community.petish.mypage.dto.MessageResponseDTO;
import com.community.petish.mypage.dto.MyWritingsDTO;
import com.community.petish.mypage.dto.QuestionRequestDTO;
import com.community.petish.mypage.dto.QuestionResponseDTO;
import com.community.petish.mypage.dto.Criteria;
import com.community.petish.mypage.dto.Writings_CommentedDTO;
import com.community.petish.mypage.dto.Writings_LikedDTO;
import com.community.petish.mypage.service.DefaultService;
import com.community.petish.mypage.service.MessageService;
import com.community.petish.mypage.service.QuestionService;
import com.community.petish.mypage.service.UserService_Mypage;
import com.community.petish.user.dto.UserModifyPictureDTO_Mypage;
import com.community.petish.user.dto.UserModifyRequestDTO_Mypage;
import com.community.petish.user.dto.UserResponseDTO_Mypage;
import com.community.petish.user.dto.response.LoginedUser;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/mypage")
public class MypageController {

	@Autowired
	private QuestionService questionServiceImpl;
	@Autowired
	private MessageService messageServiceImpl;
	@Autowired
	private DefaultService defaultServiceImpl;
	@Autowired
	private UserService_Mypage userServiceImpl;

	// 마이페이지 default
	@RequestMapping("/")
	public String mypage(Model model, HttpSession session, Criteria cri) {
		LoginedUser user = (LoginedUser) session.getAttribute("LOGIN_USER");
		// 세션이 널이면 로그인페이지로 이동 (if)
		log.info(user.getId());
		UserResponseDTO_Mypage userResponse = userServiceImpl.findUser(user.getId());
		model.addAttribute("user", userResponse);
		return "petish/mypage/default";
	}

	
	
	// -------------------회원정보수정 start
	// 회원정보수정
	@RequestMapping(value = "/modifyform/{user_id}")
	public String modifyform(@PathVariable("user_id") Long user_id, Model model, HttpSession session) {
		// 로그인 여부 확인
		if (session.getAttribute("LOGIN_USER") == null) {
			return "petish/loginpage";
		} else {
			// 회원아이디로 회원정보 찾아서 보내기
			UserResponseDTO_Mypage dto = userServiceImpl.findUser(user_id);
			model.addAttribute("dto", dto);
			return "petish/mypage/info_modify_form";
		}
	}
	// 회원정보수정로직
	@RequestMapping(value = "/modifyUserInfo", method = { RequestMethod.POST })
	public String modifyUserInfo(UserModifyRequestDTO_Mypage dto, Model model) {
		log.info("수정" + dto);
		// 비밀번호를 제외한 정보 수정(비밀번호를 제외하고는 기본값 세팅되어있어서)
		if ((dto.getPassword().equals(""))) {
			userServiceImpl.modifyUserInfo(dto);
			log.info("비밀번호제외");
		} else {
			// 비밀정보를 포함한 정보 수정
			userServiceImpl.modifyUserInfoAll(dto);
			log.info("비밀번호포함");
		}
		// 다시 default페이지로 이동
		return "redirect:./";
	}
	// 프로필 사진 수정
	@PostMapping("/uploadFormAction")
	   public String uploadFormPost(MultipartFile[] uploadFile, HttpServletRequest request, UserModifyPictureDTO_Mypage dto) {

	      //String uploadFolder = "C:\\upload";
	      String uploadPath = request.getSession().getServletContext().getRealPath("/resources/img");
	      

	      for (MultipartFile multipartFile : uploadFile) {

	         log.info("-------------------------------------");
	         log.info("Upload File Name: " + multipartFile.getOriginalFilename());
	         log.info("Upload File Size: " + multipartFile.getSize());

	         File saveFile = new File(uploadPath, multipartFile.getOriginalFilename());
	         dto.setPicture(multipartFile.getOriginalFilename());
	         userServiceImpl.modifyPicture(dto);
	         
	         try {
	            multipartFile.transferTo(saveFile);
	         } catch (Exception e) {
	            
	            log.error(e.getMessage());
	         } // end catch
	      } // end for
	      
	      return "redirect:/mypage/modifyform/"+dto.getId();
	   }
	// -------------------회원정보수정 end

	
	
	
	
	// -------------------question start
	// 문의리스트
	@RequestMapping("/question/list")
	public String questionList(Criteria cri, Model model, HttpSession session) {
		// 로그인 여부 확인
		if (session.getAttribute("LOGIN_USER") == null) {
			return "petish/loginpage";
		} else {
			// 로그인사용자 기준으로 문의db 불러오기
			LoginedUser user = (LoginedUser) session.getAttribute("LOGIN_USER");
			ArrayList<QuestionResponseDTO> list = questionServiceImpl.getQuestionList(user.getId());
			model.addAttribute("list", list);
			// 문의글수 count
			int amount = questionServiceImpl.getUndeleted(user.getId());
			model.addAttribute("amount", amount);
			return "petish/mypage/question_list";
		}
	}
	// 문의 등록
	@RequestMapping("/question/insert")
	public String insertQuestion(QuestionRequestDTO dto, HttpSession session) {
		QuestionRequestDTO dto2 = new QuestionRequestDTO();
		dto2.setUser_id(dto.getUser_id());
		dto2.setTitle(dto.getTitle());
		dto2.setContent(dto.getContent());
		dto2.setCategory_id(dto.getCategory_id());

		questionServiceImpl.insertQuestion(dto2);

		return "redirect:./list";
	}
	// 문의 삭제
	@RequestMapping("/question/delete")
	public String deleteQuestion(Long id) {
		// 글 id 기준으로 삭제
		questionServiceImpl.deleteQuestion(id);
		return "redirect:./list";
	}

	// -------------------question end

	
	
	
	
	// -------------------message start
	// 메세지리스트
	@RequestMapping("/message/list")
	public String messageList(Model model, HttpSession session) {
		// 로그인 여부 확인
		if (session.getAttribute("user_id") == null) {
			return "petish/loginpage";
		} else {
			// 로그인 사용자 기준으로 메세지db 가져오기
			Long user_id = (Long) session.getAttribute("user_id");
			// 받은 메세지
			ArrayList<MessageResponseDTO> receivedList = messageServiceImpl.getReceivedMessageList(user_id);
			model.addAttribute("receivedList", receivedList);
			// 삭제여부
			int undeletedReceived = messageServiceImpl.getUndeletedReceived(user_id);
			model.addAttribute("undeletedReceived", undeletedReceived);
			// 보낸 메세지
			ArrayList<MessageResponseDTO> sentList = messageServiceImpl.getSentMessageList(user_id);
			model.addAttribute("sentList", sentList);
			// 삭제여부
			int undeletedSent = messageServiceImpl.getUndeletedSent(user_id);
			model.addAttribute("undeletedSent", undeletedSent);

			return "petish/mypage/message_list";
		}
	}
	// 메세지 삭제
	@RequestMapping("/message/delete")
	public String messageDelete(Long id) {
		// 메세지 id기준으로 삭제
		messageServiceImpl.deleteMessage(id);
		return "redirect:./list";
	}
	// -------------------message end

	
	
}
