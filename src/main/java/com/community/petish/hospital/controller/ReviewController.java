package com.community.petish.hospital.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.community.petish.hospital.domain.ReviewVO;
import com.community.petish.hospital.service.ReviewService;
import com.fasterxml.jackson.databind.ObjectMapper;
@RestController
@RequestMapping("/hospital/review")
public class ReviewController {
	
	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping(value="/{id}", produces="application/json;charset=UTF-8")
	public String getReview(@PathVariable("id") Long id) {
		String str = "";
		List<ReviewVO> rlist;
		rlist = reviewService.getHospitalReview(id);
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(rlist);
			System.out.println(str);
		}catch(Exception e) {
			System.out.println("first() mapper : "+ e.getMessage());
		}
		return str;
		
	}
	
	@PostMapping(produces="application/json;charset=UTF-8")
	public Map<String, Object> insertReview(@RequestBody ReviewVO vo){
		System.out.println("score="+vo.getScore());
		System.out.println("content="+vo.getContent());
		System.out.println("hospital_id="+vo.getHospital_id());
		
		Map<String, Object> retVal = new HashMap<String, Object>();
		try {
			int res = reviewService.insertReview(vo);
			retVal.put("res","OK");
			
		}catch(Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
		}
		return retVal;
	}
}
