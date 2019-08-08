package com.community.petish.dog.gatherboard.dto.request;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class DogGatherCommentDTO {

	private Long ID;
	private Long POST_ID;
	private Long USER_ID;
	private String NICKNAME;
	private String CONTENT;
	private Date CREATED_DATE;
	private Date UPDATED_DATE;
	private int DELETED;
	private int COUNT;
	
}
