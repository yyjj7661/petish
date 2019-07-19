package com.community.petish.user.dto.response;

import com.community.petish.user.domain.User;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public class LoginedUser {
	
	private Long id;
	private String username;
	private String nickname;

	public LoginedUser (User user) {
		this.id = user.getId();
		this.username = user.getUsername();
		this.nickname = user.getNickname();
	}
	
}
