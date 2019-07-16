package com.community.petish.dog.missingboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.petish.dog.missingboard.domain.DogLostPostVO;
import com.community.petish.dog.missingboard.dto.DogLostPostRequestWriteDTO;
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
	public DogLostPostVO getPostDetail(int num) {
		return mapper.getPostDetail(num);
	}

	// 게시글 작성
	@Override
	public void register(DogLostPostRequestWriteDTO dto) {
		mapper.insertDogLostPost(dto);	
	}
	
	// 게시글 수정
	@Override
	public void modify(DogLostPostRequestWriteDTO dto) {
		mapper.updateDogLostPost(dto);
	}
	
	//게시글 삭제
	@Override
	public void delete(int num) {
		mapper.deleteDogLostPost(num);
	}
	
}
