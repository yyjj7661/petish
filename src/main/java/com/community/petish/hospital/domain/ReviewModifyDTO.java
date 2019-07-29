package com.community.petish.hospital.domain;

import lombok.Data;

@Data
public class ReviewModifyDTO {
	private Long id;
	private String content;
	private Integer score;
}
