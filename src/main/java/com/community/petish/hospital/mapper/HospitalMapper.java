package com.community.petish.hospital.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.community.petish.hospital.domain.Criteria;
import com.community.petish.hospital.domain.HospitalVO;

public interface HospitalMapper {
	HospitalVO getHospital(Long id);
	
	List<HospitalVO> gethospitalList(String hospital_addr);
	List<HospitalVO> getEmerhospitalList(String hospital_addr);
	
	
	List<HospitalVO> getListWithPaging(Criteria cri);
	List<HospitalVO> getEmerListWithPaging(Criteria cri);
	int getTotalCount(String hospital_addr);
	int getEmerTotalCount(String hospital_addr);
	double getScore(Long id);
}
