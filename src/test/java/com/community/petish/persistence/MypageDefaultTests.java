package com.community.petish.persistence;

import java.util.ArrayList;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.community.petish.community.mypage.dto.Criteria;
import com.community.petish.community.mypage.dto.Writings_CommentedDTO;
import com.community.petish.community.mypage.mapper.DefaultMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MypageDefaultTests {
	@Setter(onMethod_ = @Autowired)
	private DefaultMapper mapper;

	// mapper 주입 test
	@Test
	public void testMapper() {
		log.info(mapper);
	}
	
//	@Test
//	public void selectTest1() {
//		ArrayList<MyWritingsDTO> list = null;
//		list = mapper.getMyWritings(1);
//	}
//
//	@Test
//	public void selectTest2() {
//		ArrayList<Writings_CommentedDTO> list = null;
//		list = mapper.getCommented(1);
//	}
//	
//	@Test
//	public void selectTest3() {
//		ArrayList<Writings_LikedDTO> list = null;
//		list = mapper.getLiked(1);
//	}
	
	@Test
	public void testPaging() {
		Criteria cri = new Criteria();
		cri.setPageNum(1);
		cri.setAmount(10);
		cri.setUser_id(1);
		ArrayList<Writings_CommentedDTO> list = mapper.getCommentedWithPaging(cri);
	}
}
