package com.community.petish.cat.gatherboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/cat/gatherboard/*")
public class CatGatherboardController {

	@RequestMapping("/list")
	public String dogGatherboardList() {
		return "petish/cat/gatherboard/list";
	}
	
	@RequestMapping("/writeForm")
	public String dogGatherboardWriteForm() {
		return "petish/cat/gatherboard/write_form";
	}
	
}
