package com.community.petish.dog.gatherboard.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.community.petish.dog.gatherboard.domain.Criteria;
import com.community.petish.dog.gatherboard.domain.DogGatherCommentVO;
import com.community.petish.dog.gatherboard.dto.response.DogGatherCommentDTO;

public interface DogGatherCommentMapper {
	int insertComment(DogGatherCommentVO commentVO);
	DogGatherCommentVO getComment(Long commentID);
	List<DogGatherCommentDTO> getCommentList
		(@Param("cri") Criteria cri, 
		 @Param("POST_ID") Long postID);
	int modifyComment(DogGatherCommentVO commentVO);
	int removeComment(Long commentID);
	int getCommentCount(Long postID);
}
