package com.community.petish.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.community.petish.admin.service.AdminService;

@Controller
public class AdminController {
	@Autowired
	public AdminService adminService;
	
	@RequestMapping(value="/admin")
	public ModelAndView index() {
		Long userCount = adminService.getUserConunt();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("petish/admin/index");
		mv.addObject("userCount", userCount);
		return mv;
	}
}
