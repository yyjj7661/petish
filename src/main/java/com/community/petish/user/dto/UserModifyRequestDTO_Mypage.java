package com.community.petish.user.dto;

import lombok.Data;

@Data
public class UserModifyRequestDTO_Mypage {
	long id;
	String password;
	String nickname;
	String address;
	int concern_id;
	int gender;
}
