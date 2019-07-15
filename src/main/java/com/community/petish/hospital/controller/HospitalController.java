package com.community.petish.hospital.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.community.petish.hospital.service.HospitalService;

@Controller
@RequestMapping("/hospital")
public class HospitalController {
	@Autowired
	public HospitalService hospitalService;
	@RequestMapping("/searchForm")
	public String hospitalSerachForm() {
		return "petish/hospital/main_search";
	}


	
	@RequestMapping("/detail")
	public String hospitalDetail() {
		return "petish/hospital/detail";
	}
	
	
}
