package com.community.petish.hospital.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.community.petish.hospital.domain.HospitalVO;
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

	@RequestMapping("/search")
	public String gethospitalList(@RequestParam("hospital_addr") String addr) {
		System.out.println(addr);
		List<HospitalVO> list = hospitalService.gethospitalList(addr);
		System.out.println(list);
		String str ="";
						
		return str;
	}
	
	@RequestMapping("/detail")
	public String hospitalDetail() {
		return "petish/hospital/detail";
	}
	
	
}
