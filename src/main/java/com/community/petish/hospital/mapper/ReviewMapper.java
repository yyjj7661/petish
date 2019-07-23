package com.community.petish.hospital.mapper;

import java.util.List;

import com.community.petish.hospital.domain.ReviewVO;

public interface ReviewMapper {
	List<ReviewVO> getHospitalReview(Long id);
}
