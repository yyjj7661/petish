package com.community.petish.dog.missingboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/dog/missingboard/*")
public class MissingboardController {

	@RequestMapping("/list")
	public String dogMissingBoardList() {
		return "petish/dog/missingboard/list";
	}
	
}
