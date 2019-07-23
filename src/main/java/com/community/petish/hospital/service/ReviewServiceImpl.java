package com.community.petish.hospital.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.petish.hospital.domain.ReviewVO;
import com.community.petish.hospital.mapper.ReviewMapper;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService{
	
	@Autowired
	private ReviewMapper reviewMapper;
	
	@Override
	public List<ReviewVO> getHospitalReview(Long id) {
		List<ReviewVO> rlist = null; 
		rlist=reviewMapper.getHospitalReview(id); 
		return rlist;
	}

	@Override
	public int insertReview(ReviewVO vo) {

		int retVal= reviewMapper.insertReview(vo);
		return retVal;
	}
	
	
}
