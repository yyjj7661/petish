package com.community.petish.mypage.service;

import java.util.ArrayList;

import com.community.petish.mypage.dto.MessageRequestDTO;
import com.community.petish.mypage.dto.MessageResponseDTO;

public interface MessageService {

	// 1. 쪽지 작성
	public int writeMessage(MessageRequestDTO dto);

	// 2. 받은 쪽지 리스트 조회
	public ArrayList<MessageResponseDTO> getReceivedMessageList(int user_id);

	// 3. 보낸 쪽지 리스트 조회
	public ArrayList<MessageResponseDTO> getSentMessageList(int user_id);

	// 4. 쪽지 상세조회
	public int getMessageDetail(int id);

	// 5. 쪽지 삭제
	public int deleteMessage(int id);
	
	public int getUndeletedReceived(int user_id);
	
	public int getUndeletedSent(int user_id);
}
