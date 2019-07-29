package com.community.petish.mypet.comment.mapper;

import java.util.List;

import com.community.petish.mypet.comment.domain.MypetComment;
import com.community.petish.mypet.comment.dto.request.SaveMypetCommentParams;

public interface MypetCommentMapper {

	Long save(SaveMypetCommentParams saveMypetCommentParams);
	
	List<MypetComment> findAllByPostId(Long postId);
	
	Long countLikeByCommentId(Long commentId);
	
	Long countDislikeByCommentId(Long commentId);
	
}
