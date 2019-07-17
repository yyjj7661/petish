package com.community.petish.mypage.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.community.petish.mypage.dto.QuestionRequestDTO;
import com.community.petish.mypage.dto.QuestionResponseDTO;


public interface QuestionService {
		//1. 문의 등록
		public void insertQuestion(QuestionResponseDTO dto);
		//2. 문의 조회
		public ArrayList<QuestionRequestDTO> getQuestionList(int user_id);
		//3. 문의 수정
//		public void modifyQuestion(QuestionResponseDTO dto);
		//4. 문의 삭제
		public void deleteQuestion(int id);
		//5. 해당 사용자의 삭제 안된 글 갯수 가져오기
		public int getUndeleted(int user_id);

}
