package com.community.petish.hospital.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.community.petish.hospital.domain.ReviewVO;
import com.community.petish.hospital.service.ReviewService;
import com.fasterxml.jackson.databind.ObjectMapper;
@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	@PostMapping(value="/{id}", produces="application/json;charset=UTF-8")
	public String getReview(@PathVariable("id") Long id) {
		String str = "";
		List<ReviewVO> rlist;
		rlist = reviewService.getHospitalReview(id);
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(rlist);
		}catch(Exception e) {
			System.out.println("first() mapper : "+ e.getMessage());
		}
		return str;
		
	}
}
