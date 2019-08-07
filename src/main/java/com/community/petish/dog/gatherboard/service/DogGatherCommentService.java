package com.community.petish.dog.gatherboard.service;

import java.util.List;

import com.community.petish.dog.gatherboard.domain.Criteria;
import com.community.petish.dog.gatherboard.domain.DogGatherCommentVO;
import com.community.petish.dog.gatherboard.dto.request.DogGatherCommentDTO;

public interface DogGatherCommentService {
	public int insertComment(DogGatherCommentVO commentVO);
	public DogGatherCommentVO getComment(Long commentID);
	public List<DogGatherCommentVO> getCommentList(Criteria cri, Long postID);
	public int modifyComment(DogGatherCommentVO commentVO);
	public int removeCommet(Long commentID);
	public int getCommentCnt(Long postID);
}
