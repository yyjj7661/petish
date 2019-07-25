package com.community.petish.mypage.mapper;

import com.community.petish.user.dto.UserModifyPictureDTO;
import com.community.petish.user.dto.UserModifyRequestDTO;
import com.community.petish.user.dto.UserResponseDTO;

public interface UserMapper {
	//아이디로 회원정보 가져오기
	public UserResponseDTO findUser(long id);
	
	//회원정보 수정
	public int modifyUserInfo(UserModifyRequestDTO dto);
	
	//프로필사진 수정
	public int modifyPicture(UserModifyPictureDTO dto);
}
