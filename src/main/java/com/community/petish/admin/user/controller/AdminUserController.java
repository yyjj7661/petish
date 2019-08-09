package com.community.petish.admin.user.controller;

import com.community.petish.admin.user.service.AdminService;
import com.community.petish.community.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.community.petish.community.user.dto.UserResponseDTO_Mypage;

@Controller
@RequestMapping("/admin")
public class AdminUserController {

	@Autowired
	public AdminService adminService;

	@Autowired
  private UserService userService;

	@RequestMapping(produces="application/json;charset=UTF-8")
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
	
	@RequestMapping(value="/user")
	public ModelAndView user() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("petish/admin/user");
		return mv;
	}

	@RequestMapping(value="/user/delete/{id}", produces="application/json;charset=UTF-8")
	@ResponseBody
	public boolean deleteUser(@PathVariable("id") Long id) {
		return adminService.deleteUser(id);
	}
	
	@RequestMapping(value="/user/modify/{id}", produces="application/json;charset=UTF-8")
	public ModelAndView userModifyForm(@PathVariable("id") Long id) {
		ModelAndView mv = new ModelAndView();
		UserResponseDTO_Mypage modifyUser= adminService.getUser(id);
		mv.addObject("modifyUser", modifyUser);
		mv.setViewName("petish/admin/user_modify_form");
		return mv;
	}
	
	@RequestMapping(value="/user/modifyForm", produces="application/json;charset=UTF-8")
	public String modifyUser(UserResponseDTO_Mypage modifyUser) {
		int result = adminService.modifyUser(modifyUser);
		return "petish/admin/user";
	}
	
	@RequestMapping(value="/report", produces="application/json;charset=UTF-8")
	public ModelAndView report() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("petish/admin/report");
		return mv;
	}
	
	@RequestMapping(value="/question", produces="application/json;charset=UTF-8")
	public ModelAndView question() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("petish/admin/question");
		return mv;
	}
	
	
}
