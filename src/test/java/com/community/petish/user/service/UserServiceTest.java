package com.community.petish.user.service;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.community.petish.user.domain.User;
import com.community.petish.user.dto.request.SaveUserParams;
import com.community.petish.user.dto.response.UserListResponse;
import com.community.petish.user.mapper.UserMapper;

import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml", "file:src/main/webapp/WEB-INF/spring/spring-security.xml"})
@Slf4j
public class UserServiceTest {

	
	@Autowired
	UserService userService;
	
	@Autowired
	UserMapper userMapper;
	
	@AfterEach
	void deleteUsers() {
		userMapper.deleteAll();
	}
	
	@Test
	void saveUserTest() {
		String imgaddr = "https://image.fmkorea.com/files/attach/new/20181128/486616/796418645/1413259662/fa0f4a56ff0bc3e2d25ab1f3c6e42fc7.jpeg";
		SaveUserParams saveUserParams = new SaveUserParams("jjj0611@hanmail.net", "1234", "dipord", "서울 동대문구 휘경동 183-108번지", "남자", imgaddr, "dog");
		 
		Long userId = userService.saveUser(saveUserParams);
		
		log.info("새롭게 생성된 유저 아이디 : " + userId);
		
		User resultUser = userService.findById(userId);
		
		assertThat(resultUser.getId()).isEqualTo(userId);
		assertThat(resultUser.getUsername()).isEqualTo(saveUserParams.getUsername());
		assertThat(resultUser.getNickname()).isEqualTo(saveUserParams.getNickname());
	}
	
	@Test
	void findAllTest() {
		String imgaddr = "y";
		SaveUserParams saveUserParams = new SaveUserParams("jjj0611@hanmail.net", "1234", "dipord", "서울 동대문구 휘경동 183-108번지", "남자", imgaddr, "dog");
		
		userService.saveUser(saveUserParams);
		
		String imgaddr2 = "https://image.ytn.co.kr/general/jpg/2017/1018/201710181100063682_d.jpg";
		SaveUserParams saveUserParams2 = new SaveUserParams("djw627@gmail.com", "5678", "djw", "서울 동대문구 휘경동 209번지", "여", imgaddr2, "cat");
		
		userService.saveUser(saveUserParams2);
		
		UserListResponse userListResponse = userService.getUsers();

		log.info("모든 유저 : " + userListResponse);

	}
}
