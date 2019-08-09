package com.community.petish.community.mypage.dto;

import java.sql.Date;

import lombok.Data;

//db에서 가져온 Question list를 사용자에게 보여주기 위한 DTO

@Data
public class QuestionResponseDTO {
	
	// 문의 식별자 => 문의번호 (삭제시 필요)
	private Long id;

	// 문의 제목
	private String title;

	// 문의 내용
	private String content;

	// 답변 상태
	private int replied;

	// category_id로 검색한 카테고리명
	private String category;
	
	// 유저식별자
	private Long user_id;

	// 작성일자
	private Date created_date;
	
	// 삭제여부
	private int deleted;
	
	// 문의 카테고리
	private int category_id;
	
}
