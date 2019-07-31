package com.community.petish.mypage.service;

import org.springframework.stereotype.Service;

import com.community.petish.user.dto.UserModifyPictureDTO;
import com.community.petish.user.dto.UserModifyRequestDTO;
import com.community.petish.user.dto.UserResponseDTO;

public interface UserService {
	//아이디로 회원정보 가져오는 메서드
	public UserResponseDTO findUser(long id);
	
	//비밀번호 포함한 회원정보 변경하는 메서드
	public int modifyUserInfoAll(UserModifyRequestDTO dto);
	
	//비밀번호 제외한 회원정보 변경하는 메서드
	public int modifyUserInfo(UserModifyRequestDTO dto);
	
	//프로필사진 수정
	public int modifyPicture(UserModifyPictureDTO dto);
	
}
