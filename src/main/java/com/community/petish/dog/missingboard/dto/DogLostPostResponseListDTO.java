package com.community.petish.dog.missingboard.dto;

import java.util.Date;

import lombok.Data;

@Data
public class DogLostPostResponseListDTO {
	
	private Long ID; //게시글 번호

	private int DOG_AGE; //강아지 나이
	private String DOG_GENDER; //강아지 성별 
	private String DOG_IMAGE; //강아지 사진
	
	private String DOG_LOST_ADDRESS; //실종 장소
	
	private int VIEW_COUNT; //조회수
	private Date CREATE_DATE; //게시글 등록 시간
	private Date UPDATED_DATE; //게시글 수정 시간
	private int FOUND; //발견
	
	private int USER_ID; //유저 식별자
	private String DOG_SPECIES; //강아지 종
	
}
