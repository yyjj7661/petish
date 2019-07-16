package com.community.petish.dog.missingboard.domain;

import java.util.Date;

import lombok.Data;

@Data
public class testVO {
	
	private int ID; //게시글 번호

	private String DOG_NAME; //강아지 이름
	private int DOG_AGE; //강아지 나이
	private String DOG_GENDER; //강아지 성별 
	private String DOG_DESCRIPTION; //강아지 특징
	private String DOG_IMAGE; //강아지 사진
	
}
