package com.community.petish.dog.missingboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/dog/missingboard/*")
public class DogMissingboardController {

	@RequestMapping("/list")
	public String dogMissingBoardList() {
		return "petish/dog/missingboard/list";
	}
	
	@RequestMapping("/detail")
	public String dogMissingBoardDetail() {
		return "petish/dog/missingboard/detail";
	}
	
	@RequestMapping("/writeForm")
	public String dogMissingBoardWriteForm() {
		return "petish/dog/missingboard/write_form";
	}
	
	@RequestMapping("/modifyForm")
	public String dogMissingBoardModifyForm() {
		return "petish/dog/missingboard/modify_form";
	}
	
}
