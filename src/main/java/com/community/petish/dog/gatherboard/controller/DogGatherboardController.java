package com.community.petish.dog.gatherboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/dog/gatherboard/*")
public class DogGatherboardController {

	@RequestMapping("/list")
	public String dogGatherboardList() {
		return "petish/dog/gatherboard/list";
	}
	
	@RequestMapping("/detail")
	public String dogGatherboardDetail() {
		return "petish/dog/gatherboard/detail";
	}
	
	@RequestMapping("/writeForm")
	public String dogGatherboardWriteForm() {
		return "petish/dog/gatherboard/write_form";
	}
	
	@RequestMapping("/modifyForm")
	public String dogGatherboardModifyForm() {
		return "petish/dog/gatherboard/modify_form";
	}
	
}
