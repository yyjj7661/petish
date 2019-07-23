package com.community.petish.report.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.community.petish.report.domain.ReportVO;
import com.community.petish.report.dto.ReportRequestDTO;
import com.community.petish.report.service.ReportService;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/report/*")
@RestController
@Slf4j

public class ReportController {
	
	@Autowired ReportService service;
	
	//신고 등록
	@RequestMapping(value="/new",
			method=RequestMethod.POST,
			produces="application/json;charet=UTF-8")
	@ResponseBody
	public Map<String, Object> insertReport(ReportRequestDTO dto){
		
		Map<String, Object> retVal = new HashMap<String, Object>(); //리턴값 저장		
		
		System.out.println("Controller");
		
		log.info("DTO : " + dto);
		System.out.println(dto);
		
		try {
			int res = service.register(dto);
			retVal.put("res", "OK");
		}
		catch(Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
			e.printStackTrace();
		}		
		return retVal;
		
//		return result == 1
//		? new ResponseEntity<String>("success", HttpStatus.OK)
//		: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//신고 삭제
	@DeleteMapping(value="/{id}")
	public ResponseEntity<ReportVO> deleteReport(@PathVariable Long id){
		if(service.delete(id) == 1)
			return new ResponseEntity<ReportVO>(HttpStatus.OK);
		else	
			return new ResponseEntity<ReportVO>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}