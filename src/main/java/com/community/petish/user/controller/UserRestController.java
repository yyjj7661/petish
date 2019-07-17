package com.community.petish.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.community.petish.user.dto.request.SaveUserParams;
import com.community.petish.user.service.UserService;

@RestController
@RequestMapping("/api/users")
public class UserRestController {
	
	@Autowired
	UserService userService;
	
	@PostMapping
	public void save(@RequestBody SaveUserParams saveUserParams) {
		userService.saveUser(saveUserParams);
	}

}
