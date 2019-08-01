package com.community.petish.hospital.mapper;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.community.petish.hospital.domain.Criteria;
import com.community.petish.hospital.domain.ListDTO;

import lombok.extern.log4j.Log4j;

//@RunWith(SpringJUnit4ClassRunner.class)
@ExtendWith(SpringExtension.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class HospitalMapperTests {
	@Autowired
	private HospitalMapper hospitalMapper;
	
	@Test
	public void testPaging() {
		Criteria cri = new Criteria();
		cri.setHospital_addr("강남구");
		cri.setPageNum(2);
		cri.setAmount(4);
		List<ListDTO> list = hospitalMapper.getListWithPaging(cri);
		list.forEach(board -> log.info(board));
	}
}
