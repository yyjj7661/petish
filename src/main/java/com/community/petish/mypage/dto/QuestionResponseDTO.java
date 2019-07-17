package com.community.petish.mypage.dto;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
public class QuestionResponseDTO {

	// 문의 제목
	private String title;

	// 문의 내용
	private String content;

	// 유저식별자
	private int user_id;

	// 문의카테고리 식별자
	private int category_id;
}
