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
	
}
