package com.community.petish.dog.gatherboard.mapper;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.community.petish.dog.gatherboard.domain.Criteria;
import com.community.petish.dog.gatherboard.domain.DogGatherCommentVO;

import lombok.extern.log4j.Log4j;

//@RunWith(SpringJUnit4ClassRunner.class)
@ExtendWith(SpringExtension.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class CommentMapperTests {
	
	@Autowired
	DogGatherCommentMapper mapper;
	
	@Test
	public void testInsert() throws Exception {
		DogGatherCommentVO commentVO = new DogGatherCommentVO();
		commentVO.setCONTENT("testComment");
		commentVO.setPOST_ID(19L);
		commentVO.setUSER_ID(1L);
		
		log.info("CommentVO="+commentVO.toString());
	}
	
	@Test
	public void testGet() throws Exception {
		mapper.getComment(1L);
	}
	
	@Test
	public void testGetList() throws Exception {
		Criteria cri = new Criteria();
		List<DogGatherCommentVO> commentVO = mapper.getCommentList(cri, 45L);
	}
}
