package com.community.petish.dog.missingboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.community.petish.dog.missingboard.domain.testVO;
import com.community.petish.dog.missingboard.mapper.testMapper;

public class testServiceImpl implements testService {
	
	@Autowired
	private testMapper mapper;
	
	//게시글 수
		public int getPostCount() {
			return mapper.getCount();
		};
		
		//게시글 리스트
		public List<testVO> getPostList(){
			return mapper.getPostList();
		}
		
		//게시글 조회
		public testVO getPostDetail(int num) {
			return mapper.getPostDetail(num);
		}
		
		//게시글  작성
		public int insertTest(testVO vo) {
			return mapper.insertTest(vo);
		}
		
		//게시글 수정
		public int updateTest(testVO vo) {
			return mapper.updateTest(vo);
		}
		
		//게시글 삭제
		public int deleteTest(int num) {
			return mapper.deleteTest(num);
		}
		
}
