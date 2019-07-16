package com.community.petish.hospital.mapper;

import java.util.List;

import com.community.petish.hospital.domain.Criteria;
import com.community.petish.hospital.domain.HospitalVO;

public interface HospitalMapper {
	List<HospitalVO> gethospitalList(String hospital_addr);
	List<HospitalVO> getEmerhospitalList(String hospital_addr);
	List<HospitalVO> getListWithPaging(Criteria cri);
}
