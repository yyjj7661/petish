package com.community.petish.user.mapper;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.community.petish.user.dto.request.JoinUserParams;
import com.community.petish.user.dto.response.UserDetailResponse;

import lombok.extern.log4j.Log4j;

@ExtendWith(SpringExtension.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class UserMapperTest {

	@Autowired
	UserMapper userMapper;
	
	@Test
	void userMapperTest() {
		log.info(userMapper);
	}
	
	@Test
	void saveUser() {
		String imgaddr = "https://image.fmkorea.com/files/attach/new/20181128/486616/796418645/1413259662/fa0f4a56ff0bc3e2d25ab1f3c6e42fc7.jpeg";
		JoinUserParams joinUserParams = new JoinUserParams("jjj0611@hanmail.net", "1234", "dipord", "서울 동대문구 휘경동 183-108번지", "남자", imgaddr, "dog");
		userMapper.save(joinUserParams);
		
		UserDetailResponse userDetailResponse = userMapper.findByUsername("jjj0611@hanmail.net");
		log.info(userDetailResponse);
		assertThat(joinUserParams.getNickname()).isEqualTo(userDetailResponse.getNickname());
	}
	
}
