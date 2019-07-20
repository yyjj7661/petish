package com.community.petish.user.service;

import javax.servlet.http.HttpSession;

import com.community.petish.user.domain.User;
import com.community.petish.user.dto.request.LoginUserParams;
import com.community.petish.user.dto.request.SaveUserParams;
import com.community.petish.user.dto.response.UserListResponse;

public interface UserService {

	Long saveUser(SaveUserParams saveUserParams);
	
	void login(LoginUserParams loginUserParams, HttpSession session);
	
	void logout(HttpSession session);

	User findById(Long id);
	
	UserListResponse getUsers();
	
}
