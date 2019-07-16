package com.community.petish.dog.missingboard.mapper;

import java.util.List;

import com.community.petish.dog.missingboard.domain.testVO;

public interface testMapper {
	
	//게시글 수
	int getCount();
	
	//게시글 리스트
	List<testVO> getPostList();
	
	//게시글 조회
	testVO getPostDetail(int num);
	
	//게시글  작성
	int insertTest(testVO vo);
	
	//게시글 수정
	int updateTest(testVO vo);
	
	//게시글 삭제
	int deleteTest(int num);
	
}
