package com.community.petish.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	@RequestMapping(value="/admin")
	public String index() {
		return "petish/admin/index";
	}
}
