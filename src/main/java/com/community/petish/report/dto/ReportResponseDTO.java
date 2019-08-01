package com.community.petish.report.dto;

import java.util.Date;

public class ReportResponseDTO {
	
	private Long ID; //신고 식별자
	
	private String DESCRIPTION; //신고 내용
	private Date CREATED_DATE; //신고 날짜
	private String CATEGORY_NAME; //신고 카테고리 식별자
	
	private String BOARD_TABLE_NAME; //게시판 이름
	private Long POST_ID; //게시글 번호
	private Long USER_ID; //유저 식별자
	//private String NICKNAME; //유저 닉네임
	
}
