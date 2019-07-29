package com.community.petish.hospital.service;

import java.util.List;

import com.community.petish.hospital.domain.Criteria;
import com.community.petish.hospital.domain.ReviewVO;
import com.community.petish.hospital.domain.getReviewDTO;

public interface ReviewService {
	List<ReviewVO> getHospitalReviewList(Long id);
	List<getReviewDTO> getReviewWithPaging(Criteria cri);
	Integer insertReview(ReviewVO vo);
	Integer deleteReview(Long id);
	Integer getTotalCount(Long id);
}
