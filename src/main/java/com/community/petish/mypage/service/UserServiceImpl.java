package com.community.petish.mypage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.petish.mypage.mapper.UserMapper;
import com.community.petish.user.dto.UserModifyPictureDTO;
import com.community.petish.user.dto.UserModifyRequestDTO;
import com.community.petish.user.dto.UserResponseDTO;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class UserServiceImpl implements UserService{

	@Autowired
	UserMapper mapper;
	
	@Override
	public UserResponseDTO findUser(long id) {
		UserResponseDTO dto = mapper.findUser(id);
		return dto;
	}

	@Override
	public int modifyUserInfo(UserModifyRequestDTO dto) {
		int res = mapper.modifyUserInfo(dto);
		return res;
	}

	@Override
	public int modifyPicture(UserModifyPictureDTO dto) {
		int res = mapper.modifyPicture(dto);
		return res;
	}
	

}
