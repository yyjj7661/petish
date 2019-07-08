package com.community.petish.hospital.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/hospital")
public class HospitalController {

	@RequestMapping("/searchForm")
	public String hospitalSerachFrom() {
		return "petish/hospital/main_search";
	}
	
	@RequestMapping("/list")
	public String hospitalList() {
		return "petish/hospital/list";
	}
	
	@RequestMapping("/detail")
	public String hospitalDetail() {
		return "petish/hospital/detail";
	}
	
}
