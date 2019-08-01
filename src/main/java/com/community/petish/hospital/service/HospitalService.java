package com.community.petish.hospital.service;

import java.util.List;

import com.community.petish.hospital.domain.Criteria;
import com.community.petish.hospital.domain.HospitalVO;
import com.community.petish.hospital.domain.ListDTO;
import com.community.petish.hospital.domain.ReviewVO;


public interface HospitalService {
	HospitalVO getHospital(Long id);
	
	List<HospitalVO> gethospitalList(String hospital_addr);
	List<HospitalVO> getEmerhospitalList(String hospital_addr);
	List<ListDTO> getListWithPaging(Criteria cri);
	List<ListDTO> getEmerListWithPaging(Criteria cri);
	
	Integer getTotalCount(String hospital_addr);
	Integer getEmerTotalCount(String hospital_addr);

	Double getScore(Long id);
}
