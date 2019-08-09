package com.community.petish.community.dog.gatherboard.dto.response;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

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
	@JsonFormat(pattern="yyyy/MM/dd HH:mm")
	private Date CREATED_DATE;
	@JsonFormat(pattern="yyyy/MM/dd HH:mm")
	private Date UPDATED_DATE;
	private int DELETED;
	private int COUNT;
	
}
