package com.community.petish.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.petish.admin.mapper.AdminMapper;

@Service("adminService")
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminMapper adminMapper;
	@Override
	public Long getUserCount() {
		return adminMapper.getUserCount();
	}
	@Override
	public Long getMaleCount() {
		// TODO Auto-generated method stub
		return adminMapper.getMaleCount();
	}
	@Override
	public Long getFemaleCount() {
		// TODO Auto-generated method stub
		return adminMapper.getFemaleCount();
	}
	@Override
	public Long getConcernCatCount() {
		// TODO Auto-generated method stub
		return adminMapper.getConcernCatCount();
	}
	@Override
	public Long getConcernDogCount() {
		// TODO Auto-generated method stub
		return adminMapper.getConcernDogCount();
	}
	

}
