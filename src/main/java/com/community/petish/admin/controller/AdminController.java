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
		Long userCount = adminService.getUserCount();
		Long maleCount = adminService.getMaleCount();
		Long femaleCount = adminService.getFemaleCount();
		Long concernCat = adminService.getConcernCatCount();
		Long concernDog = adminService.getConcernDogCount();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("petish/admin/index");
		mv.addObject("userCount", userCount);
		mv.addObject("maleCount", maleCount);
		mv.addObject("femaleCount", femaleCount);
		mv.addObject("concernCat", concernCat);
		mv.addObject("concernDog", concernDog);
		
		
		return mv;
	}
	
	@RequestMapping(value="/admin/user")
	public ModelAndView user() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("petish/admin/user");
		return mv;
	}
}
