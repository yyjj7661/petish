package com.community.petish.dog.missingboard.dto;


import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DogLostPostRequestWriteDTO {
	
	private Long ID; //게시글 번호

	private String DOG_NAME; //강아지 이름
	private int DOG_AGE; //강아지 나이
	private String DOG_GENDER; //강아지 성별 
	private String DOG_DESCRIPTION; //강아지 특징
	private String DOG_IMAGE; //강아지 사진
	
	private Date DOG_LOST_DATE; //실종 일시
	private String PHONE_NUMBER; //연락처
	private String DOG_LOST_ADDRESS; //실종 장소
	private int REWARD; //사례금
	
	private int FOUND; //발견
	
	private int USER_ID; //유저 식별자
	private int SPECIES_ID; //강아지 종류 식별자	
	
}
