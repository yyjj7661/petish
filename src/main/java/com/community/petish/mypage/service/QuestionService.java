package com.community.petish.mypage.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.community.petish.mypage.dto.QuestionResponseDTO;
import com.community.petish.mypage.dto.QuestionRequestDTO;


public interface QuestionService {
		//1. 문의 등록
		public void insertQuestion(QuestionRequestDTO dto);
		//2. 문의 조회
		public ArrayList<QuestionResponseDTO> getQuestionList(int user_id);
		//3. 문의 삭제
		public void deleteQuestion(int id);
		//4. 사용자의 삭제 안된 글 갯수 확인
		public int getUndeleted(int user_id);

}
