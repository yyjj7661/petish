package com.community.petish.hospital.service;

import java.util.List;

import com.community.petish.hospital.domain.ReviewVO;

public interface ReviewService {
	List<ReviewVO> getHospitalReview(Long id);
	int insertReview(ReviewVO vo);
}
