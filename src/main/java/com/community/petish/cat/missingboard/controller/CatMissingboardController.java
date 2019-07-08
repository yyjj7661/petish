package com.community.petish.cat.missingboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/cat/missingboard/*")
public class CatMissingboardController {

	@RequestMapping("/list")
	public String dogMissingBoardList() {
		return "petish/cat/missingboard/list";
	}
	
	@RequestMapping("/writeForm")
	public String dogMissingWriteForm() {
		return "petish/cat/missingboard/write_form";
	}
	
}
