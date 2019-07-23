package com.community.petish.mypage.dto;

import lombok.Data;

//내가 쓴 글
@Data
public class MyWritingsDTO {
	
	//게시판종류, 게시글번호, 게시글제목, 작성일자, 조회수
	Integer boardType;
	long id;
	String title;
	String created_date;
	Integer view_count;
	
}
