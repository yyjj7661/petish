package com.community.petish.mypet.comment.mapper;

import com.community.petish.mypet.comment.dto.request.SaveMypetCommentParams;

public interface MypetCommentMapper {

	Long save(SaveMypetCommentParams saveMypetCommentParams);
	
}
