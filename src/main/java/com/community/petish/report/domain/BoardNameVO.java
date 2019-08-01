package com.community.petish.report.domain;

import lombok.Data;

@Data
public class BoardNameVO {
	private Long ID; //게시판 식별자
	private String BOARD_TABLE_NAME; //테이블 이름
}