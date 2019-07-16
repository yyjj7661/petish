package com.community.petish.dog.missingboard.mapper;

import java.util.List;

import com.community.petish.dog.missingboard.domain.DogLostPostVO;
import com.community.petish.dog.missingboard.dto.DogLostPostRequestWriteDTO;
import com.community.petish.dog.missingboard.dto.DogLostPostResponseListDTO;


public interface DogLostPostMapper {
	
	//게시글 수
	int getPostCount();
	
	//게시글 리스트
	List<DogLostPostResponseListDTO> getDogLostList();
	
	//게시글 조회
	DogLostPostVO getPostDetail(int num);
	
	//게시글  작성
	int insertDogLostPost(DogLostPostRequestWriteDTO dto);
	
	//게시글 수정
	int updateDogLostPost(DogLostPostRequestWriteDTO dto);
	
	//게시글 삭제
	int deleteDogLostPost(int num);
	
}
