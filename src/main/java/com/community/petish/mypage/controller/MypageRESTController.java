package com.community.petish.mypage.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.community.petish.mypage.dto.Criteria;
import com.community.petish.mypage.dto.MessageRequestDTO;
import com.community.petish.mypage.dto.MessageResponseDTO;
import com.community.petish.mypage.dto.MyWritingsDTO;
import com.community.petish.mypage.dto.PageDTO;
import com.community.petish.mypage.dto.Writings_CommentedDTO;
import com.community.petish.mypage.dto.Writings_LikedDTO;
import com.community.petish.mypage.service.DefaultService;
import com.community.petish.mypage.service.MessageService;
import com.community.petish.mypage.service.QuestionService;
import com.community.petish.mypage.service.UserService;
import com.community.petish.user.dto.UserModifyPictureDTO;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/mypage/api/*")
public class MypageRESTController {
	
	@Autowired
	private QuestionService questionServiceImpl;
	@Autowired
	private MessageService messageServiceImpl;
	@Autowired
	private UserService userServiceImpl;
	@Autowired
	private DefaultService defaultServiceImpl;
	
	// -------------------메세지(모달) start
	// 받은 메세지 세부내용 보기
	@GetMapping(value = "/message/received/{id}", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<MessageResponseDTO> receivedMessageDetail(@PathVariable("id") int id) {
		return new ResponseEntity<MessageResponseDTO>(messageServiceImpl.receivedMessageDetail(id), HttpStatus.OK);
	}
	// 보낸 메세지 세부내용 보기
	@GetMapping(value = "/message/sent/{id}", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<MessageResponseDTO> sentMessageDetail(@PathVariable("id") int id) {
		return new ResponseEntity<MessageResponseDTO>(messageServiceImpl.sentMessageDetail(id), HttpStatus.OK);
	}
	// 메세지 삭제
	@DeleteMapping(value = "/message/{id}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> delete(@PathVariable("id") int id) {
		//세션확인
		return messageServiceImpl.deleteMessage(id) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	// 받은메세지 읽음으로 변경
	@RequestMapping(method = { RequestMethod.PUT,
			RequestMethod.PATCH }, value = "/message/{id}/{receiver_id}", consumes = "application/json", produces = {
					MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> changeReadAttr(MessageRequestDTO dto, @PathVariable("id") int id,
			@PathVariable("receiver_id") int receiver_id) {
		dto.setId(id);
		dto.setReceiver_id(receiver_id);
		return messageServiceImpl.changeReadAttr(dto) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	//메세지 작성
	@PostMapping(value = "/message/new",
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody MessageRequestDTO dto){
		log.info("Message DTO :"+dto);
		int insertCount = messageServiceImpl.writeMessage(dto);
		log.info("insert count : "+insertCount);
		return insertCount == 1
			? new ResponseEntity<>("success", HttpStatus.OK)
			: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);	
	}
	// -------------------메세지(모달) end
	
	
	
	
	// -------------------defaultPage start
	//내가 쓴 글 리스트
	@GetMapping(value="/Writinglist",
			produces = {
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<MyWritingsDTO>> getWritingList(
				HttpSession session, Criteria cri){
				log.info("Writinglist");
				int user_id = (int)session.getAttribute("user_id");
				cri.setUser_id(user_id);
				return new ResponseEntity<>(defaultServiceImpl.getMyWritingsWithPaging(cri), HttpStatus.OK);
			}
	
	//내가 댓글 쓴 글 리스트
	@GetMapping(value="/Commentedlist",
			produces = {
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<Writings_CommentedDTO>> getCommentedList(
				HttpSession session, Criteria cri){
				log.info("Commentedlist");
				int user_id = (int)session.getAttribute("user_id");
				cri.setUser_id(user_id);
				return new ResponseEntity<>(defaultServiceImpl.getCommentedWithPaging(cri), HttpStatus.OK);
			}
	//내가 좋아요 한 글 리스트
	@GetMapping(value="/Likedlist",
			produces = {
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<Writings_LikedDTO>> getLikedList(
				HttpSession session, Criteria cri){
				log.info("Likedlist");
				int user_id = (int)session.getAttribute("user_id");
				cri.setUser_id(user_id);
				return new ResponseEntity<>(defaultServiceImpl.getLikedWithPaging(cri), HttpStatus.OK);
			}
	// -------------------defaultPage end
		
}
