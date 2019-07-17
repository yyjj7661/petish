package com.community.petish.user.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import oracle.sql.DATE;

@Getter
@AllArgsConstructor
public class User {

	private Long id;
	private String username;
	private String password;
	private String nickname;
	private String address;
	private String gender;
	private String picture;
	private DATE join_date;
	private DATE updated_date;
	private int deleted;
	private int concern_id;
	
}
