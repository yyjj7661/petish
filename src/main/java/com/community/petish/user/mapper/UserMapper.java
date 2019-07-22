package com.community.petish.user.mapper;

import java.util.List;

import com.community.petish.user.domain.User;
import com.community.petish.user.dto.request.SaveUserParams;
import com.community.petish.user.dto.response.UserDetailResponse;

public interface UserMapper {

	Long save(SaveUserParams saveUserParams);

	List<UserDetailResponse> findAll();
	
	String findByNickname(String nickname);
	
	User findByUsername(String username);
	
	User findById(Long id);
	
	
	void deleteAll();
	
}
