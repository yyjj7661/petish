package com.community.petish.dog.gatherboard.service;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.community.petish.dog.gatherboard.domain.Criteria;
import com.community.petish.dog.gatherboard.domain.DogGatherPostVO;
import com.community.petish.dog.gatherboard.domain.DogSpeciesVO;
import com.community.petish.dog.gatherboard.dto.request.DogGatherCommentDTO;

import lombok.extern.log4j.Log4j;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml", "file:src/main/webapp/WEB-INF/spring/spring-security.xml" })
@Log4j
public class DogGatherBoardServiceTests {

	@Autowired
	private DogGatherService dogGatherService;
	
	@Autowired
	private DogGatherCommentService dogGatherCommentService;
	
	
	@Test
	public void testInsert() throws Exception {
		DogGatherPostVO postVO = new DogGatherPostVO();
		
		postVO.setTITLE("test");
		postVO.setCONTENT("test");
		postVO.setVIEW_COUNT(1);
		postVO.setPEOPLE_COUNT(2);
		postVO.setGATHERING_ADDRESS("서울");
		postVO.setDELETED(0);
		log.info("userid================="+dogGatherService.getUserID("yeji"));
		postVO.setUSER_ID(dogGatherService.getUserID("yeji"));
		postVO.setSPECIES_ID(dogGatherService.getDogSpeciesID("말티즈"));
		postVO.setREGION_ID(dogGatherService.getRegionID("서울"));
		
		dogGatherService.insertDogGatherPost(postVO);
		
		log.info(postVO);
	}
	
	@Test
	public void testDogSpecies() {
		Long dogSizeID = 1L;
		List<DogSpeciesVO> list = dogGatherService.getDogSpeciesList(dogSizeID);
		log.info("=============================================");
		log.info("DOG_SPECIES_LIST="+list.toString());
		log.info("=============================================");
	}
}
