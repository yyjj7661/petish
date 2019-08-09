package com.community.petish.community.mypage.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.petish.community.mypage.dto.QuestionResponseDTO;
import com.community.petish.community.mypage.dto.Criteria;
import com.community.petish.community.mypage.dto.QuestionRequestDTO;
import com.community.petish.community.mypage.mapper.QuestionMapper;

@Service
public class QuestionServiceImpl implements QuestionService{

	@Autowired
	private QuestionMapper questionMapper;
	
	//1. 문의 등록
	@Override
	public void insertQuestion(QuestionRequestDTO dto) {
		questionMapper.insertQuestion(dto);
	}

	//2-1. 문의 조회
	@Override
	public ArrayList<QuestionResponseDTO> getQuestionList(Long user_id) {
		ArrayList list = questionMapper.getQuestionList(user_id);
		return list;
	}

	//2-2. 문의조회+페이징
	@Override
	public ArrayList<QuestionResponseDTO> getQuestionListWithPaging(Criteria cri){
		return questionMapper.getQuestionListWithPaging(cri);
	}
	
	//3. 문의 삭제
	@Override
	public void deleteQuestion(Long id) {
		
		questionMapper.deleteQuestion(id);
	}

	//4. 사용자의 삭제 안된 글 갯수 확인
	@Override
	public int getUndeleted(Long user_id) {
		int undeleted = questionMapper.getUndeleted(user_id);
		return undeleted;
	}

}
