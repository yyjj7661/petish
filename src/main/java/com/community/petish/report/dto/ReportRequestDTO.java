package com.community.petish.report.dto;

import lombok.Data;

@Data
public class ReportRequestDTO {
	
	private Long USER_ID; //유저 아이디
	private String DESCRIPTION; //신고 내용
	private Long CATEGORY_ID; //신고 카테고리 식별자
	
	private Long BOARD_ID; //게시판 번호
	private Long POST_ID; //게시글 번호
	
}