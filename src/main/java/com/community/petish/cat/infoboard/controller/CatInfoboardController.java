package com.community.petish.cat.infoboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/cat/infoboard/*")
public class CatInfoboardController {
	
	@RequestMapping("/list")
	public String dogInfoboardList() {
		return "/petish/cat/infoboard/list";
	}
	
	@RequestMapping("/detail")
	public String dogInfoboardDetail() {
		return "/petish/cat/infoboard/detail";
	}
	
	@RequestMapping("/writeForm")
	public String dogInfoboardWriteForm() {
		return "/petish/cat/infoboard/write_form";
	}

}
