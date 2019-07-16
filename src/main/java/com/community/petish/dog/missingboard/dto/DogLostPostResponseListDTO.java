package com.community.petish.dog.missingboard.dto;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DogLostPostResponseListDTO {
	
	private int ID; //게시글 번호

	private int DOG_AGE; //강아지 나이
	private String DOG_GENDER; //강아지 성별 
	
	private int VIEW_COUNT; //조회수
	private Date CREATE_DATE; //게시글 등록 시간
	private Date UPDATED_DATE; //게시글 수정 시간
	private int FOUND; //발견
	
	private int REGION_ID; //지역 식별자
	private int USER_ID; //유저 식별자
	private int SPECIES_ID; //강아지 종류 식별자
	
}
