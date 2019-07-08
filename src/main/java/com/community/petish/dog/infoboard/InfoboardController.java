package com.community.petish.dog.infoboard;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/dog/infoboard/*")
public class InfoboardController {
	
	@RequestMapping("/list")
	public String dogInfoboardList() {
		return "/petish/dog/infoboard/list";
	}

}
