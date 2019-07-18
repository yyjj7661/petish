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
	public ArrayList<MessageResponseDTO> getReceivedMessageList(int user_id) {
		ArrayList list = messageMapper.getReceivedMessageList(user_id);
		return list;
	}

	@Override
	public ArrayList<MessageResponseDTO> getSentMessageList(int user_id) {
		ArrayList list = messageMapper.getSentMessageList(user_id);
		return list;
	}

	@Override
	public int getMessageDetail(int id) {
		int res = messageMapper.getMessageDetail(id);
		return res;
	}

	@Override
	public int deleteMessage(int id) {
		int res = messageMapper.deleteMessage(id);
		return res;
	}

	@Override
	public int getUndeletedReceived(int user_id) {
		int undeletedReceived = messageMapper.getUndeletedReceived(user_id);
		return undeletedReceived;
	}

	@Override
	public int getUndeletedSent(int user_id) {
		int undeletedSent = messageMapper.getUndeletedSent(user_id);
		return undeletedSent;
	}
	

}
