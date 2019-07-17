package com.community.petish.user.mapper;

import com.community.petish.user.domain.User;
import com.community.petish.user.dto.request.SaveUserParams;
import com.community.petish.user.dto.response.UserDetailResponse;

public interface UserMapper {

	Long save(SaveUserParams saveUserParams);
	
	UserDetailResponse findByUsername(String username);
	
	User findById(Long id);
	
	void deleteAll();
	
}
