package com.community.petish.dog.gatherboard.dto.request;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@AllArgsConstructor
public class DogGatherCommentDTO {
	private Long ID;
	private int COUNT;
	private String USERNAME;
	private String CONTENT;
	private Date CREATED_DATE;
	private Date UPDATED_DATE;
	private int DELETED;
	private Long POST_ID;
}
