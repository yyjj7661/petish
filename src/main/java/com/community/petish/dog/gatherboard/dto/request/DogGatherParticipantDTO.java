package com.community.petish.dog.gatherboard.dto.request;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DogGatherParticipantDTO {
	private Long ID;
	private Long POST_ID;
	private int CANCELED;
	private String USERNAME;
	private String DOG_SPECIES;
	private String REQUEST_CONTENT;
}