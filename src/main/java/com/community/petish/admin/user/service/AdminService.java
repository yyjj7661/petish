package com.community.petish.admin.user.service;

import java.util.List;

import com.community.petish.admin.user.domain.getUserListDTO;
import com.community.petish.community.user.dto.UserResponseDTO_Mypage;

public interface AdminService {
	Long getUserCount();
	Long getMaleCount();
	Long getFemaleCount();
	Long getConcernCatCount();
	Long getConcernDogCount();
	boolean deleteUser(Long id);
	List<getUserListDTO> getUserList();
	UserResponseDTO_Mypage getUser(Long id);
	
	Integer modifyUser(UserResponseDTO_Mypage modifyUser);
}
