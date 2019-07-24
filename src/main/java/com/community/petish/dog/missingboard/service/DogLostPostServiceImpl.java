package com.community.petish.dog.missingboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.petish.dog.missingboard.dto.DogLostPostRequestWriteDTO;
import com.community.petish.dog.missingboard.dto.DogLostPostResponseDetailDTO;
import com.community.petish.dog.missingboard.dto.DogLostPostResponseListDTO;
import com.community.petish.dog.missingboard.mapper.DogLostPostMapper;

@Service
public class DogLostPostServiceImpl implements DogLostPostService{
	
	@Autowired
	private DogLostPostMapper mapper;
	
	//게시글 수
	@Override
	public int getPostCount() {
		return mapper.getPostCount();
	}
	
	//게시글 리스트
	@Override
	public List<DogLostPostResponseListDTO> getPostList(){
		return mapper.getDogLostList();
	}

	// 게시글 조회
	@Override
	public DogLostPostResponseDetailDTO getPostDetail(Long id) {
		return mapper.getPostDetail(id);
	}
	
	// 게시글 조회 수 갱신
	public int updateViewCount(Long id) {
		return mapper.updateViewCount(id);
	}

	// 게시글 작성
	@Override
	public int register(DogLostPostRequestWriteDTO dto) {
		return mapper.insertPost(dto);
		
	}
	
	// 게시글 수정
	@Override
	public int modify(DogLostPostRequestWriteDTO dto) {
		System.out.println("[Service] 수정 dto : " + dto.getDog_name());
		System.out.println("[Service] 수정 dto : " + dto.getDog_description());
		
		return mapper.updatePost(dto);
	}
	
	//게시글 삭제
	@Override
	public int delete(Long id) {
		return mapper.deletePost(id);
	}
	
	
}
