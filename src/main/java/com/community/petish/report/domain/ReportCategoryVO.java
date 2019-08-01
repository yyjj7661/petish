package com.community.petish.report.domain;

import lombok.Data;

@Data
public class ReportCategoryVO {
	private Long ID; //신고 카테고리 식별자
	private String CATEGORY_NAME; //신고 카테고리
}