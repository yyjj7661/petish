package com.community.petish.hospital.mapper;

import java.util.List;

import com.community.petish.hospital.domain.Criteria;
import com.community.petish.hospital.domain.ReviewVO;
import com.community.petish.hospital.domain.getReviewDTO;

public interface ReviewMapper {
	List<ReviewVO> getHospitalReviewList(Long id);
	List<getReviewDTO> getReviewWithPaging(Criteria cri);
	Integer getHospitalReview(ReviewVO vo);
	Integer insertReview(ReviewVO vo);
	
	Integer getTotalCount(Long id);
}
