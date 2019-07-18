package com.community.petish.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.community.petish.user.domain.User;
import com.community.petish.user.dto.request.SaveUserParams;
import com.community.petish.user.dto.response.UserListResponse;
import com.community.petish.user.exception.UserNotFoundException;
import com.community.petish.user.mapper.UserMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class UserServiceImpl implements UserService{

	@Autowired
	UserMapper userMapper;
	
	@Autowired
	PasswordEncoder passwordEncoder;

	@Override
	public Long saveUser(SaveUserParams saveUserParams) {
		
		String encodedPassword = passwordEncoder.encode(saveUserParams.getPassword());
		saveUserParams.setPassword(encodedPassword);
		Long userId =  userMapper.save(saveUserParams);
		return userId;
	}

	@Override
	public User findById(Long id) {

		User user = userMapper.findById(id);
		
		if (user == null) {
			throw new UserNotFoundException("해당하는 유저를 찾을 수 없습니다. userId : " + id);
		}
		
		return user;
	}

	@Override
	public UserListResponse getUsers() {
		
		UserListResponse userListResponse = new UserListResponse(userMapper.findAll());
		return userListResponse;
	}
	
}
