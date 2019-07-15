package com.community.petish.user.dto.response;

import lombok.Getter;

@Getter
public class UserDetailResponse {

	private Long id;
	private String username;
	private String nickname;
	private String gender;
	private String profileImage;
	private String concern;
	
}
