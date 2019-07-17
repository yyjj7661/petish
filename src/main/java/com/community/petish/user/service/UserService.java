package com.community.petish.user.service;

import com.community.petish.user.dto.request.SaveUserParams;

public interface UserService {

	Long saveUser(SaveUserParams saveUserParams);
	
}
