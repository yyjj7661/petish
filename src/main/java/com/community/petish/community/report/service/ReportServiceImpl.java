package com.community.petish.community.report.service;

import java.util.List;

import com.community.petish.community.report.dto.ReportRequestDTO;
import com.community.petish.community.report.dto.ReportResponseDTO;
import com.community.petish.community.report.mapper.ReportMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReportServiceImpl implements ReportService{
	
	@Autowired
	private ReportMapper mapper;
	
	//신고 수
//	 public int getReportCount() {
//		return mapper.getReportCount();
//	}
	
	//신고 리스트 조회
//	List<ReportResponseDTO> getList();
		
	//신고 작성
	public int register(ReportRequestDTO dto) {
		System.out.println("Service");
		return mapper.insertReport(dto);
	}
	
	//신고 삭제
	public int delete(Long id) {
		return mapper.deleteReport(id);
	}
	
	//신고 리스트
	public List<ReportResponseDTO> getReportList(){
		return mapper.getReportList();
	}
		
	//신고 조회
	public ReportResponseDTO getReport(Long id) {
		return mapper.getReport(id);
	}
}
