package com.community.petish.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {
	
	@RequestMapping("/kakaomap")
	public String kakaomap() {
		return "commons/kakaomap";
	}

}
