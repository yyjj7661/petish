package com.community.petish.hospital.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.petish.hospital.domain.HospitalVO;
import com.community.petish.hospital.mapper.HospitalMapper;

@Service("hospitalService")
public class HospitalServiceImpl implements HospitalService{
	
	@Autowired
	private HospitalMapper hospitalMapper;
	
	@Override
	public List<HospitalVO> gethospitalList(String hospital_addr) {
		
		 List<HospitalVO> hospitalList = null; 
		 hospitalList=hospitalMapper.gethospitalList(hospital_addr); 
		 
		 return hospitalList;
		 
	}

}
