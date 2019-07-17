package com.community.petish.user.mapper;

import com.community.petish.user.dto.request.JoinUserParams;
import com.community.petish.user.dto.response.UserDetailResponse;

public interface UserMapper {

	Long save(JoinUserParams joinUserParams);
	
	UserDetailResponse findByUsername(String username);
	
	void deleteAll();
	
}
