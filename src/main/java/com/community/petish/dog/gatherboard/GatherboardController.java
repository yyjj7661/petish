package com.community.petish.dog.gatherboard;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/dog/gatherboard/*")
public class GatherboardController {

	@RequestMapping("/list")
	public String dogGatherboardList() {
		return "petish/dog/gatherboard/list";
	}
	
}
