package com.community.petish.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.petish.admin.mapper.AdminMapper;

@Service("adminService")
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminMapper adminMapper;
	@Override
	public Long getUserConunt() {
		return adminMapper.getUserCount();
	}
	

}
