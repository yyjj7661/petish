package com.community.petish.mypet.post.domain;

import java.sql.Date;

import lombok.Getter;

@Getter
public class MypetPost {

	private Long id;
	private String title;
	private String content;
	private String image;
	private Date createdDate;
	private Date updatedDate;
	
	private Long userId;
	
}
