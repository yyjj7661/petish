package com.community.petish.hospital.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/hospital")
public class HospitalController {

	@RequestMapping("searchForm")
	public String hospitalSerachFrom() {
		return "hospital/main_search";
	}
	
}
