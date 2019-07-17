package com.community.petish.mypage.dto;

import java.util.Date;

import lombok.Data;

//Question list 사용자에게 보여주기 위한 DTO

@Data
public class QuestionResponseDTO {
	
	
	// 문의 식별자 => 문의번호 (삭제시 필요)
	private int id;

	// 문의 제목
	private String title;

	// 문의 내용
	private String content;

	// 답변 상태
	private int replied;

	// category_id로 검색한 카테고리명
	private String category;
	
	// 유저식별자
	private int user_id;

	// 작성일자
	private String question_created_date;
	
	// 삭제여부
	private int deleted;
	
}
