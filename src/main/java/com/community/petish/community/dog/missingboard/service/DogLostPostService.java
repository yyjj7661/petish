package com.community.petish.community.dog.missingboard.service;

import java.util.List;

import com.community.petish.community.dog.missingboard.domain.AttachFileVO;
import com.community.petish.community.dog.missingboard.dto.Criteria;
import com.community.petish.community.dog.missingboard.dto.DogLostPostRequestWriteDTO;
import com.community.petish.community.dog.missingboard.dto.DogLostPostResponseDetailDTO;
import com.community.petish.community.dog.missingboard.dto.DogLostPostResponseListDTO;

public interface DogLostPostService {
	
	// 게시글 수
	int getPostCount(Criteria cri);

	// 게시글 리스트
	List<DogLostPostResponseListDTO> getPostList(Criteria cri);
	
	// 게시글 리스트(페이징)
	//List<DogLostPostResponseListDTO> getListWithPaging(Criteria cri);
	
	// 게시글 조회
	DogLostPostResponseDetailDTO getPostDetail(Long id);

	// 게시글 조회 수 갱신
	int updateViewCount(Long id);
		
	// 게시글 작성
	void register(DogLostPostRequestWriteDTO dto);

	// 게시글 수정
	int modify(DogLostPostRequestWriteDTO dto);

	// 게시글 삭제
	int delete(Long id);
	
	// 사진 첨부
	List<AttachFileVO> getAttachList(Long postId);
}
