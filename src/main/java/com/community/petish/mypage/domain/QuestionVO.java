package com.community.petish.mypage.domain;

import java.util.Date;

import lombok.Data;

@Data
public class QuestionVO {
	//문의 식별자 => 문의번호
	private int id; 
	
	//문의 제목
	private String title; 
	
	//문의 내용
	private String content;
	
	//답변 상태
	private int replied;
	
	//삭제 유무
	private int deleted;
	
	//유저식별자
	private int user_id;
	
	//문의카테고리 식별자
	private int category_id;
	
	//문의작성일자
	private String question_created_date;
	
}
