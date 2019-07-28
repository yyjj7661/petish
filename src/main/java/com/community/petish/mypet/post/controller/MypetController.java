package com.community.petish.mypet.post.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mypet")
public class MypetController {
	
	@GetMapping
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
