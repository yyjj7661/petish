package com.community.petish.community.mypage.service;

import java.util.ArrayList;

import com.community.petish.community.mypage.dto.QuestionResponseDTO;
import com.community.petish.community.mypage.dto.Criteria;
import com.community.petish.community.mypage.dto.QuestionRequestDTO;


public interface QuestionService {
		//1. 문의 등록
		public void insertQuestion(QuestionRequestDTO dto);
		//2-1. 문의 조회
		public ArrayList<QuestionResponseDTO> getQuestionList(Long user_id);
		//2-2. 문의조회+페이징
		public ArrayList<QuestionResponseDTO> getQuestionListWithPaging(Criteria cri);
		//3. 문의 삭제
		public void deleteQuestion(Long id);
		//4. 사용자의 삭제 안된 글 갯수 확인
		public int getUndeleted(Long user_id);

}
