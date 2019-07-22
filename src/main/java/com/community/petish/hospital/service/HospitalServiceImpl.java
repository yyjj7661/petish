package com.community.petish.hospital.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.petish.hospital.domain.Criteria;
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
	@Override
	public List<HospitalVO> getEmerhospitalList(String hospital_addr) {
		
		 List<HospitalVO> hospitalList = null; 
		 hospitalList=hospitalMapper.getEmerhospitalList(hospital_addr); 
		 
		 return hospitalList;
		 
	}
	@Override
	public List<HospitalVO> getListWithPaging(Criteria cri) {
		 List<HospitalVO> hospitalList = null; 
		 hospitalList=hospitalMapper.getListWithPaging(cri); 
		 
		 return hospitalList;
	}
	@Override
	public List<HospitalVO> getEmerListWithPaging(Criteria cri) {
		 List<HospitalVO> hospitalList = null; 
		 hospitalList=hospitalMapper.getEmerListWithPaging(cri); 
		 
		 return hospitalList;
	}
	@Override
	public int getTotalCount(String hospital_addr) {
		
		return hospitalMapper.getTotalCount(hospital_addr);
	}
	@Override
	public int getEmerTotalCount(String hospital_addr) {
		// TODO Auto-generated method stub
		return hospitalMapper.getEmerTotalCount(hospital_addr);
	}
	@Override
	public HospitalVO getHospital(Long id) {
		HospitalVO vo = hospitalMapper.getHospital(id);
		return vo;
	}
	@Override
	public double getScore(Long id) {
		// TODO Auto-generated method stub
		return hospitalMapper.getScore(id);
	}

}
