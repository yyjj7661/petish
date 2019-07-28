package com.community.petish.dog.missingboard.mapper;

import java.util.List;

import com.community.petish.dog.missingboard.domain.DogLostPostVO;
import com.community.petish.dog.missingboard.dto.Criteria;
import com.community.petish.dog.missingboard.dto.DogLostPostRequestWriteDTO;
import com.community.petish.dog.missingboard.dto.DogLostPostResponseDetailDTO;
import com.community.petish.dog.missingboard.dto.DogLostPostResponseListDTO;


public interface DogLostPostMapper {
	
	//게시글 수
	int getPostCount(Criteria cri);
	
	//게시글 리스트
	List<DogLostPostResponseListDTO> getDogLostList(Criteria cri);
	
	//게시글 리스트(페이징)
	//List<DogLostPostResponseListDTO> getListWithPaging(Criteria cri);
	
	//게시글 조회
	DogLostPostResponseDetailDTO getPostDetail(Long id);
	
	//게시글 조회 수 갱신
	int updateViewCount(Long id);
	
	//게시글  작성
	int insertPost(DogLostPostRequestWriteDTO dto);
	//int insertSelectKey(DogLostPostRequestWriteDTO dto);	
	
	//게시글 수정
	int updatePost(DogLostPostRequestWriteDTO dto);
	
	//게시글 삭제
	int deletePost(Long id);	
	
}
