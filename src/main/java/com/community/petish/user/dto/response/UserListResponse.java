package com.community.petish.user.dto.response;

import java.util.List;

public class UserListResponse {

	private List<UserDetailResponse> users;
	
	public UserListResponse(List<UserDetailResponse> users) {
		this.users = users;
	}
	
}
