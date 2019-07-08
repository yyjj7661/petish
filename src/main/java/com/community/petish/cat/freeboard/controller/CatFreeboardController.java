package com.community.petish.cat.freeboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/cat/freeboard/*")
public class CatFreeboardController {

	@RequestMapping("/list")
	public String dogFreeboardList() {
		return "petish/cat/freeboard/list";
	}
	
	@RequestMapping("/writeForm")
	public String dogFreeboardWriteForm() {
		return "petish/cat/freeboard/write_form";
	}
	
}
