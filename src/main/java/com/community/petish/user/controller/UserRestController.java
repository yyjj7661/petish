package com.community.petish.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.community.petish.user.dto.request.SaveUserParams;
import com.community.petish.user.dto.response.UserListResponse;
import com.community.petish.user.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/api/users")
public class UserRestController {
	
	@Autowired
	UserService userService;
	
	@GetMapping(produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
	public UserListResponse getUsers()   {
		UserListResponse userListResponse = userService.getUsers();
		log.info(userListResponse.toString());
		return userListResponse;
	}
	
	@PostMapping(consumes = {"application/json"})
	public void save(@RequestBody SaveUserParams saveUserParams) {
		userService.saveUser(saveUserParams);
	}

}
