package com.community.petish.mypage.mapper;

import java.util.ArrayList;

import com.community.petish.mypage.dto.MessageRequestDTO;
import com.community.petish.mypage.dto.MessageResponseDTO;

public interface MessageMapper {
	
	//1. 쪽지 작성
	public int writeMessage(MessageRequestDTO dto);
	
	//2. 받은 쪽지 리스트 조회
	public ArrayList<MessageResponseDTO> getReceiveMessageList(int user_id);
	
	//3. 보낸 쪽지 리스트 조회
	public ArrayList<MessageResponseDTO> getSendMessageList(int user_id);
	
	//4. 쪽지 상세조회
	public MessageResponseDTO getMessageDetail(int id);
	
	//5. 쪽지 삭제
	public int deleteMessage(int id);
}
