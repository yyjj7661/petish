package com.community.petish.mypage.service;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.petish.mypage.dto.QuestionResponseDTO;
import com.community.petish.mypage.dto.QuestionRequestDTO;
import com.community.petish.mypage.mapper.QuestionMapper;

@Service
public class QuestionServiceImpl implements QuestionService{

	@Autowired
	private QuestionMapper questionMapper;
	
	@Override
	public void insertQuestion(QuestionRequestDTO dto) {

		questionMapper.insertQuestion(dto);
	}

	@Override
	public ArrayList<QuestionResponseDTO> getQuestionList(int user_id) {
		ArrayList list = questionMapper.getQuestionList(user_id);
		return list;
	}

	@Override
	public void deleteQuestion(int id) {
		
		questionMapper.deleteQuestion(id);
	}

	@Override
	public int getUndeleted(int user_id) {
		int undeleted = questionMapper.getUndeleted(user_id);
		return undeleted;
	}



}
