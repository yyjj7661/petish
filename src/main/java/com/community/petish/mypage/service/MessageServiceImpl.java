package com.community.petish.mypage.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.petish.mypage.dto.MessageRequestDTO;
import com.community.petish.mypage.dto.MessageResponseDTO;
import com.community.petish.mypage.mapper.MessageMapper;

@Service
public class MessageServiceImpl implements MessageService{

	@Autowired
	private MessageMapper messageMapper;
	
	
	@Override
	public int writeMessage(MessageRequestDTO dto) {
		int res = messageMapper.writeMessage(dto);
		return res;
	}

	@Override
	public ArrayList<MessageResponseDTO> getReceiveMessageList(int user_id) {
		ArrayList list = messageMapper.getReceiveMessageList(user_id);
		return list;
	}

	@Override
	public ArrayList<MessageResponseDTO> getSendMessageList(int user_id) {
		ArrayList list = messageMapper.getSendMessageList(user_id);
		return list;
	}

	@Override
	public MessageResponseDTO getMessageDetail(int id) {
		MessageResponseDTO dto = messageMapper.getMessageDetail(id);
		return dto;
	}

	@Override
	public int deleteMessage(int id) {
		int res = messageMapper.deleteMessage(id);
		return res;
	}

}
