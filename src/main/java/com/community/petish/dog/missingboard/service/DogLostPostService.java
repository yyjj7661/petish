package com.community.petish.dog.missingboard.service;

import java.util.List;

import com.community.petish.dog.missingboard.domain.DogLostPostVO;
import com.community.petish.dog.missingboard.dto.DogLostPostRequestWriteDTO;
import com.community.petish.dog.missingboard.dto.DogLostPostResponseListDTO;

public interface DogLostPostService {
	
	// 게시글 수
	int getPostCount();

	// 게시글 리스트
	List<DogLostPostResponseListDTO> getPostList();

	// 게시글 조회
	DogLostPostVO getPostDetail(int num);

	// 게시글 작성
	//void register(DogLostPostRequestDTO dto);
	void register(DogLostPostRequestWriteDTO dto);

	// 게시글 수정
	void modify(DogLostPostRequestWriteDTO dto);

	// 게시글 삭제
	void delete(int num);

	

}
