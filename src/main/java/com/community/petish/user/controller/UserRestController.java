package com.community.petish.user.controller;

import java.util.Objects;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.community.petish.user.dto.request.LoginUserParams;
import com.community.petish.user.dto.request.SaveUserParams;
import com.community.petish.user.dto.response.LoginedUser;
import com.community.petish.user.dto.response.UserDetailResponse;
import com.community.petish.user.dto.response.UserListResponse;
import com.community.petish.user.exception.AuthenticationException;
import com.community.petish.user.exception.NotLoginedException;
import com.community.petish.user.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/api/users")
public class UserRestController {
	
	@Autowired
	UserService userService;
	
	@PostMapping(consumes = {"application/json"})
	public void save(@RequestBody SaveUserParams saveUserParams) {
		log.info("회원가입 요청 saveUserParams = {}", saveUserParams);
		Long userId = userService.saveUser(saveUserParams);
		log.info("회원가입 성공 userId = {}", userId);
	}
	
	@GetMapping(produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
	public UserListResponse getUsers()   {
		log.info("전체 유저에 대한 조회 요청");
		UserListResponse userListResponse = userService.getUsers();
		log.info(userListResponse.toString());
		return userListResponse;
	}
	
	@GetMapping(value="/{userId}", produces = { MediaType.APPLICATION_JSON_UTF8_VALUE })
	public UserDetailResponse getUser(@PathVariable("userId") Long userId) {
		log.info("user 조회 : userId = {}", userId);
		UserDetailResponse userDetailResponse = userService.getUser(userId);
		return userDetailResponse;
	}
	
	@GetMapping(value="/duplicate/{nickname}", produces= { MediaType.APPLICATION_JSON_UTF8_VALUE })
	public Boolean nicknameDuplicateCheck(@PathVariable("nickname") String nickname) {
		log.info("nickname 중복 체크 : " + nickname);
		Boolean isNicknameDuplicated = userService.checkNicknameDuplication(nickname);
		return isNicknameDuplicated;
	}
	
	@GetMapping("/authenticate")
	public LoginedUser isAuthenticated(HttpSession session) {
		if (Objects.isNull(session.getAttribute("LOGIN_USER"))) {
			throw new AuthenticationException();
		}
		return (LoginedUser) session.getAttribute("LOGIN_USER");
	}
	
	@PostMapping(value = "/login", consumes = { "application/json" })
	public void Login(@RequestBody LoginUserParams loginUserParams, HttpSession session) {
		log.info("로그인 요청 loginUserParams = {}", loginUserParams);
		userService.login(loginUserParams, session);
	}
	
	@PostMapping("/logout")
	public void logout(HttpSession session) {
		LoginedUser user = (LoginedUser) session.getAttribute("LOGIN_USER");
		if ( user == null) {
			throw new NotLoginedException();
		}
		log.info("로그아웃 요청 user = {}", user);
		userService.logout(session);
	}
	
	

}
