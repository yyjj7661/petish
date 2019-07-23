package com.community.petish.report.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReportVO {
	private Long ID; //신고 식별자
	
	private String DESCRIPTION; //신고 내용
	private Date CREATED_DATE; //신고 날짜
	private int DELETED; //삭제 유무
	
	private Long CATEGORY_ID; //신고 카테고리 식별자
	private Long BOARD_ID; //게시판 식별자
	private Long POST_ID; //게시글 번호
	private Long USER_ID; //유저 식별자
}