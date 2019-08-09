package com.community.petish.community.mypage.service;

import com.community.petish.community.user.dto.UserModifyPictureDTO_Mypage;
import com.community.petish.community.user.dto.UserModifyRequestDTO_Mypage;
import com.community.petish.community.user.dto.UserResponseDTO_Mypage;

public interface UserService_Mypage {
	//아이디로 회원정보 가져오는 메서드
	public UserResponseDTO_Mypage findUser(long id);
	
	//비밀번호 포함한 회원정보 변경하는 메서드
	public int modifyUserInfoAll(UserModifyRequestDTO_Mypage dto);
	
	//비밀번호 제외한 회원정보 변경하는 메서드
	public int modifyUserInfo(UserModifyRequestDTO_Mypage dto);
	
	//프로필사진 수정
	public int modifyPicture(UserModifyPictureDTO_Mypage dto);
	
}
