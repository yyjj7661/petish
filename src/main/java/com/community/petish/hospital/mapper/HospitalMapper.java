package com.community.petish.hospital.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.community.petish.hospital.domain.Criteria;
import com.community.petish.hospital.domain.HospitalVO;

public interface HospitalMapper {
	List<HospitalVO> gethospitalList(String hospital_addr);
	List<HospitalVO> getEmerhospitalList(String hospital_addr);
	List<HospitalVO> getListWithPaging(Criteria cri);
}
