package com.community.petish.hospital.service;

import java.util.List;

import com.community.petish.hospital.domain.Criteria;
import com.community.petish.hospital.domain.HospitalVO;


public interface HospitalService {
	HospitalVO getHospital(Long id);
	
	List<HospitalVO> gethospitalList(String hospital_addr);
	List<HospitalVO> getEmerhospitalList(String hospital_addr);
	List<HospitalVO> getListWithPaging(Criteria cri);
	List<HospitalVO> getEmerListWithPaging(Criteria cri);
	
	int getTotalCount(String hospital_addr);
	int getEmerTotalCount(String hospital_addr);

	double getScore(Long id);
}
