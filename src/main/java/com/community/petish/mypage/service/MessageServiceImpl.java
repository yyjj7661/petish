package com.community.petish.mypage.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

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
	public ArrayList<MessageResponseDTO> getReceivedMessageList(int user_id) {
		ArrayList list = messageMapper.getReceivedMessageList(user_id);
		return list;
	}

	//3. 보낸 쪽지 리스트 조회
	@Override
	public ArrayList<MessageResponseDTO> getSentMessageList(int user_id) {
		ArrayList list = messageMapper.getSentMessageList(user_id);
		return list;
	}

	//4. 쪽지 상세조회
	@Override
	public MessageResponseDTO getMessageDetail(int id) {
		
		MessageResponseDTO dto = messageMapper.getMessageDetail(id);
		return dto;
	}

	//5. 쪽지 삭제
	@Override
	public int deleteMessage(int id) {
		int res = messageMapper.deleteMessage(id);
		return res;
	}

	//6. 받은 메세지중 삭제안된 메세지 갯수
	@Override
	public int getUndeletedReceived(int user_id) {
		int undeletedReceived = messageMapper.getUndeletedReceived(user_id);
		return undeletedReceived;
	}

	//7. 보낸 메세지중 삭제안된 메세지 갯수
	@Override
	public int getUndeletedSent(int user_id) {
		int undeletedSent = messageMapper.getUndeletedSent(user_id);
		return undeletedSent;
	}

	@Override
	public int changeReadAttr(int id, int user_id) {
		int res = messageMapper.changeReadAttr(id, user_id);
		return res;
	}

	

}
