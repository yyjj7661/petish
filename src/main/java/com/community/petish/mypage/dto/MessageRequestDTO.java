package com.community.petish.mypage.dto;

import lombok.Data;

//message 사용자에게 입력받아 db에 저장할 때 쓰일 DTO
@Data
public class MessageRequestDTO {
	// 쪽지 제목
	String title;

	// 쪽지 내용
	String content;

	// 발신자
	int sender_id;

	// 수신자
	int receiver_id;
}
