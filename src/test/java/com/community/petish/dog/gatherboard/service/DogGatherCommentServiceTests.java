package com.community.petish.dog.gatherboard.service;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.community.petish.dog.gatherboard.domain.Criteria;
import com.community.petish.dog.gatherboard.dto.request.DogGatherCommentDTO;

import lombok.extern.log4j.Log4j;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml", "file:src/main/webapp/WEB-INF/spring/spring-security.xml" })
@Log4j
public class DogGatherCommentServiceTests {
	
	@Autowired
	private DogGatherCommentService dogGatherCommentService;
	
	@Test
	public void testDogGatherDTOList() {
		Criteria cri = new Criteria();
		Long postID = 98L;
		List<DogGatherCommentDTO> list = dogGatherCommentService.getCommentList(cri, postID);
	}
}
