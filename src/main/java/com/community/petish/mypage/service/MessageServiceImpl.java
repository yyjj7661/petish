package com.community.petish.mypage.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.petish.mypage.dto.MessageRequestDTO;
import com.community.petish.mypage.dto.MessageResponseDTO;
import com.community.petish.mypage.mapper.MessageMapper;

@Service
public class MessageServiceImpl implements MessageService{

	@Autowired
	private MessageMapper messageMapper;
	
	//1. 쪽지 작성
	@Override
	public int writeMessage(MessageRequestDTO dto) {
		int res = messageMapper.writeMessage(dto);
		return res;
	}

	//2. 받은 쪽지 리스트 조회
	@Override
	public ArrayList<MessageResponseDTO> getReceivedMessageList(Long user_id) {
		ArrayList list = messageMapper.getReceivedMessageList(user_id);
		return list;
	}

	//3. 보낸 쪽지 리스트 조회
	@Override
	public ArrayList<MessageResponseDTO> getSentMessageList(Long user_id) {
		ArrayList list = messageMapper.getSentMessageList(user_id);
		return list;
	}

	//4. 받은 쪽지 상세조회
	@Override
	public MessageResponseDTO receivedMessageDetail(Long id) {
		
		MessageResponseDTO dto = messageMapper.receivedMessageDetail(id);
		return dto;
	}

	// 5. 보낸 쪽지 상세조회
	@Override
	public MessageResponseDTO sentMessageDetail(Long id) {
		
		MessageResponseDTO dto = messageMapper.sentMessageDetail(id);
		return dto;
	}
	
	//6. 쪽지 삭제
	@Override
	public int deleteMessage(Long id) {
		int res = messageMapper.deleteMessage(id);
		return res;
	}

	//7. 받은 메세지중 삭제안된 메세지 갯수
	@Override
	public int getUndeletedReceived(Long user_id) {
		int undeletedReceived = messageMapper.getUndeletedReceived(user_id);
		return undeletedReceived;
	}

	//8. 보낸 메세지중 삭제안된 메세지 갯수
	@Override
	public int getUndeletedSent(Long user_id) {
		int undeletedSent = messageMapper.getUndeletedSent(user_id);
		return undeletedSent;
	}

	//9. 쪽지 읽음으로 변경
	@Override
	public int changeReadAttr(MessageRequestDTO dto) {
	       int res = messageMapper.changeReadAttr(dto);
	       return res;
	}

	

}
