package com.community.petish.mypage.dto;

import lombok.Data;

//내가 좋아요 한 글
@Data
public class Writings_LikedDTO {

	//게시판종류, 게시글번호, 작성자, 게시글제목, 작성일자, 조회수
	Integer boardType;
	long id;
	long user_id;
	String nickname;
	String title;
	String created_date;
	Integer view_count;
}
