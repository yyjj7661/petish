package com.community.petish.community.user.domain;

import org.springframework.security.crypto.password.PasswordEncoder;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import oracle.sql.DATE;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
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
	
	public boolean matchPassword(String password, PasswordEncoder passwordEncoder) {
		return passwordEncoder.matches(password, this.password);
	}
	
}
