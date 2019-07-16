package com.community.petish.hospital.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.community.petish.hospital.domain.HospitalVO;
import com.community.petish.hospital.service.HospitalService;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/hospital")
public class HospitalController {
	@Autowired
	public HospitalService hospitalService;
	
	@RequestMapping("/searchForm")
	public String hospitalSerachForm() {
		return "petish/hospital/main_search";
	}

	@RequestMapping(value="/search/{addr}/{isEmer}", produces="application/json;charset=UTF-8")
	@ResponseBody
	public String gethospitalList(@PathVariable("addr") String addr, @PathVariable("isEmer")boolean isEmer) {
		List<HospitalVO> list;
		//응급 진료 체크박스 체크 안했을때
		if(isEmer==false) {
			
			list = hospitalService.gethospitalList(addr);
		}
		//응급진료 체크박스 체크 했을때
		else {
			list = hospitalService.getEmerhospitalList(addr);
		}
		
		System.out.println(list);
		String str ="";
		ObjectMapper mapper = new ObjectMapper();
		try {
			//list json 형태롤변경
			str = mapper.writeValueAsString(list);
		}catch(Exception e) {
			System.out.println("first() mapper : "+ e.getMessage());
		}
						
		return str;
	}
	
	@RequestMapping("/detail")
	public String hospitalDetail() {
		return "petish/hospital/detail";
	}
	
	
}
