package com.community.petish.community.mypage.service;

import java.util.ArrayList;

import com.community.petish.community.mypage.dto.LikedPageDTO;
import com.community.petish.community.mypage.dto.MyWritingsDTO;
import com.community.petish.community.mypage.dto.Writings_CommentedDTO;
import com.community.petish.community.mypage.dto.Writings_LikedDTO;
import com.community.petish.community.mypage.dto.CommentedPageDTO;
import com.community.petish.community.mypage.dto.Criteria;
import com.community.petish.community.mypage.dto.WritingPageDTO;

public interface DefaultService {

	// 내가 작성한 글
	//public ArrayList<MyWritingsDTO> getMyWritings(long user_id);
	public ArrayList<MyWritingsDTO> getMyWritingsWithPaging(Criteria cri);
	public WritingPageDTO getWritingListPaging(Criteria cri);
	
	
	
	// 내가 댓글 단 글
	//public ArrayList<Writings_CommentedDTO> getCommented(long user_id);
	public ArrayList<Writings_CommentedDTO> getCommentedWithPaging(Criteria cri);
	public CommentedPageDTO getCommentedListPaging(Criteria cri);
	
	// 내가 좋아요 한 글
	//public ArrayList<Writings_LikedDTO> getLiked(long user_id);
	public ArrayList<Writings_LikedDTO> getLikedWithPaging(Criteria cri);
	public LikedPageDTO getLikedListPaging(Criteria cri);

}
