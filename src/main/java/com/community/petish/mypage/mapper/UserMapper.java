package com.community.petish.mypage.mapper;

import com.community.petish.user.dto.UserModifyPictureDTO;
import com.community.petish.user.dto.UserModifyRequestDTO;
import com.community.petish.user.dto.UserResponseDTO;

public interface UserMapper {
	//아이디로 회원정보 가져오기
	public UserResponseDTO findUser(long id);
	
	//비밀번호 포함한 회원정보 수정
	public int modifyUserInfoAll(UserModifyRequestDTO dto);
	
	//비밀번호 제외한 회원정보
	public int modifyUserInfo(UserModifyRequestDTO dto);
	
	//프로필사진 수정
	public int modifyPicture(UserModifyPictureDTO dto);
}
