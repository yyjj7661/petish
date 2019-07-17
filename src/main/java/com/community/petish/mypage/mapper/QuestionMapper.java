package com.community.petish.mypage.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import com.community.petish.mypage.dto.QuestionResponseDTO;
import com.community.petish.mypage.dto.QuestionRequestDTO;

public interface QuestionMapper {
	//1. 문의 등록
	public void insertQuestion(QuestionRequestDTO dto);
	//2. 문의 조회
	//public ArrayList<QuestionRequestDTO> getQuestionList(HashMap<String, Integer> map);
	public ArrayList<QuestionResponseDTO> getQuestionList(int num);
	//3. 문의 수정
//	public void modifyQuestion(QuestionResponseDTO dto);
	//4. 문의 삭제
	public void deleteQuestion(int num);
	//5. 삭제 안된 글 갯수 가져오기
	public int getUndeleted(int user_id);

}
