package com.community.petish.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.petish.user.dto.request.SaveUserParams;
import com.community.petish.user.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	UserMapper userMapper;

	@Override
	public Long saveUser(SaveUserParams saveUserParams) {
		
		
		return userMapper.save(saveUserParams);
	}
	
}
