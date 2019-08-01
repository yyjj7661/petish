package com.community.petish.dog.missingboard.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.community.petish.dog.missingboard.domain.TestVO;

public interface TestService {
	
	//게시글 수
	public int getPostCount();
	
	//게시글 리스트
	public List<TestVO> getPostList();
	
	//게시글 조회
	public TestVO getPostDetail(int num);
	
	//게시글  작성
	public int insertTest(TestVO vo);
	
	//게시글 수정
	public int updateTest(TestVO vo);
	
	//게시글 삭제
	public int deleteTest(int num);
	
}
