package com.community.petish.mypage.mapper;

import java.util.ArrayList;

import com.community.petish.mypage.dto.MyWritingsDTO;
import com.community.petish.mypage.dto.Writings_CommentedDTO;
import com.community.petish.mypage.dto.Writings_LikedDTO;

public interface DefaultMapper {
	//내가 작성한 글
	public ArrayList<MyWritingsDTO> getMyWritings(long user_id);
	//내가 댓글 단 글
	public ArrayList<Writings_CommentedDTO> getCommented(long user_id);
	//내가 좋아요 한 글 
	public ArrayList<Writings_LikedDTO> getLiked(long user_id);
}
