package com.community.petish.community.mypage.controller;

import javax.servlet.http.HttpSession;

import com.community.petish.community.mypage.dto.LikedPageDTO;
import com.community.petish.community.mypage.dto.MessageRequestDTO;
import com.community.petish.community.mypage.service.DefaultService;
import com.community.petish.community.mypage.service.MessageService;
import com.community.petish.community.mypage.service.QuestionService;
import com.community.petish.community.mypage.service.UserService_Mypage;
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

import com.community.petish.community.mypage.dto.CommentedPageDTO;
import com.community.petish.community.mypage.dto.Criteria;
import com.community.petish.community.mypage.dto.MessageResponseDTO;
import com.community.petish.community.mypage.dto.WritingPageDTO;

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
	private UserService_Mypage userServiceImpl;
	@Autowired
	private DefaultService defaultServiceImpl;
	
	// -------------------메세지(모달) start
	// 받은 메세지 세부내용 보기
	@GetMapping(value = "/message/received/{id}", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<MessageResponseDTO> receivedMessageDetail(@PathVariable("id") Long id) {
		return new ResponseEntity<MessageResponseDTO>(messageServiceImpl.receivedMessageDetail(id), HttpStatus.OK);
	}
	// 보낸 메세지 세부내용 보기
	@GetMapping(value = "/message/sent/{id}", produces = { MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<MessageResponseDTO> sentMessageDetail(@PathVariable("id") Long id) {
		return new ResponseEntity<MessageResponseDTO>(messageServiceImpl.sentMessageDetail(id), HttpStatus.OK);
	}
	// 메세지 삭제
	@DeleteMapping(value = "/message/{id}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> delete(@PathVariable("id") Long id) {
		//세션확인
		return messageServiceImpl.deleteMessage(id) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	// 받은메세지 읽음으로 변경
	@RequestMapping(method = { RequestMethod.PUT,
			RequestMethod.PATCH }, value = "/message/{id}/{receiver_id}", consumes = "application/json", produces = {
					MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> changeReadAttr(MessageRequestDTO dto, @PathVariable("id") Long id,
                                               @PathVariable("receiver_id") Long receiver_id) {
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
	@GetMapping(value="/Writinglist/W/{page}",
			produces = {
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<WritingPageDTO> getWritingList(
				@PathVariable("page") int page,
				HttpSession session){
				log.info("Writinglist");
				Long user_id = (Long)session.getAttribute("user_id");
				Criteria cri = new Criteria(page,10, user_id);
				log.info("내가쓴글페이지"+page);
				return new ResponseEntity<>(defaultServiceImpl.getWritingListPaging(cri), HttpStatus.OK);
			}
	
	//내가 댓글 쓴 글 리스트
	@GetMapping(value="/Commentedlist/C/{page}",
			produces = {
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<CommentedPageDTO> getCommentedList(
			@PathVariable("page") int page,
			HttpSession session){
				log.info("Commentedlist");
				Long user_id = (Long)session.getAttribute("user_id");
				Criteria cri = new Criteria(page,10, user_id);
				return new ResponseEntity<>(defaultServiceImpl.getCommentedListPaging(cri), HttpStatus.OK);
			}
	//내가 좋아요 한 글 리스트
	@GetMapping(value="/Likedlist/L/{page}",
			produces = {
					MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<LikedPageDTO> getLikedList(
			@PathVariable("page") int page,
			HttpSession session){
				log.info("Likedlist");
				Long user_id = (Long)session.getAttribute("user_id");
				Criteria cri = new Criteria(page,10, user_id);
				return new ResponseEntity<>(defaultServiceImpl.getLikedListPaging(cri), HttpStatus.OK);
			}
	// -------------------defaultPage end
		
}
