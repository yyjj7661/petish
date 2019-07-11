package com.community.petish.mypet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypet/*")
public class MypetController {

	@RequestMapping("/list")
	public String mypetList() {
		return "petish/mypet/list";
	}
	
	@RequestMapping("/writeForm")
	public String writeForm() {
		return "petish/mypet/writeForm";
	}
	
	@RequestMapping("/modifyForm")
	public String modifyForm() {
		return "petish/mypet/modifyForm";
	}
	
}
