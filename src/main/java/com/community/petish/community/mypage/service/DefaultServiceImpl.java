package com.community.petish.community.mypage.service;

import java.util.ArrayList;

import com.community.petish.community.mypage.dto.LikedPageDTO;
import com.community.petish.community.mypage.dto.MyWritingsDTO;
import com.community.petish.community.mypage.dto.Writings_CommentedDTO;
import com.community.petish.community.mypage.dto.Writings_LikedDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.petish.community.mypage.dto.WritingPageDTO;
import com.community.petish.community.mypage.dto.CommentedPageDTO;
import com.community.petish.community.mypage.dto.Criteria;
import com.community.petish.community.mypage.mapper.DefaultMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class DefaultServiceImpl implements DefaultService{

	@Autowired
	DefaultMapper mapper;
	
	@Override
	public ArrayList<MyWritingsDTO> getMyWritingsWithPaging(Criteria cri) {
		log.info(cri);
		ArrayList list = mapper.getMyWritingsWithPaging(cri);
		return list;
	}

	@Override
	public WritingPageDTO getWritingListPaging(Criteria cri) {
		log.info("내가쓴글갯수"+mapper.getWritingsCnt(cri.getUser_id()));
		return new WritingPageDTO(
				mapper.getWritingsCnt(cri.getUser_id()),		
				mapper.getMyWritingsWithPaging(cri));
	}
	
	
	
	@Override
	public ArrayList<Writings_CommentedDTO> getCommentedWithPaging(Criteria cri) {
		ArrayList list = mapper.getCommentedWithPaging(cri);
		return list;
	}

	@Override
	public CommentedPageDTO getCommentedListPaging(Criteria cri) {
		return new CommentedPageDTO(
				mapper.getCommentedCnt(cri.getUser_id()),
				mapper.getCommentedWithPaging(cri));
	}
	
	@Override
	public ArrayList<Writings_LikedDTO> getLikedWithPaging(Criteria cri) {
		ArrayList list = mapper.getLikedWithPaging(cri);
		return list;
	}
	@Override
	public LikedPageDTO getLikedListPaging(Criteria cri) {
		return new LikedPageDTO(
				mapper.getLikedCnt(cri.getUser_id()),
				mapper.getLikedWithPaging(cri));
	}
	
//	@Override
//	public ArrayList<MyWritingsDTO> getMyWritings(long user_id) {
//		ArrayList list = mapper.getMyWritings(user_id);
//		return list;
//	}
//
//	@Override
//	public ArrayList<Writings_CommentedDTO> getCommented(long user_id) {
//		ArrayList list = mapper.getCommented(user_id);
//		return list;
//	}
//
//	@Override
//	public ArrayList<Writings_LikedDTO> getLiked(long user_id) {
//		ArrayList list = mapper.getLiked(user_id);
//		return list;
//	}

}
