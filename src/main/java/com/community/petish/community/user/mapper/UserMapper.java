package com.community.petish.community.user.mapper;

import java.util.List;

import com.community.petish.community.user.domain.User;
import com.community.petish.community.user.dto.request.SaveUserParams;
import com.community.petish.community.user.dto.response.UserDetailResponse;

public interface UserMapper {

	Long save(SaveUserParams saveUserParams);

	List<UserDetailResponse> findAll();
	
	String findByNickname(String nickname);
	
	User findByUsername(String username);
	
	User findById(Long id);

	void deleteAll();
	
}
