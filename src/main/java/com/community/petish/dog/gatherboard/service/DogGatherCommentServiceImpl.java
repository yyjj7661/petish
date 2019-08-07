package com.community.petish.dog.gatherboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.community.petish.dog.gatherboard.domain.Criteria;
import com.community.petish.dog.gatherboard.domain.DogGatherCommentVO;
import com.community.petish.dog.gatherboard.dto.request.DogGatherCommentDTO;
import com.community.petish.dog_gatherboard.mapper.DogGatherCommentMapper;

@Service("dogGatherCommentService")
public class DogGatherCommentServiceImpl implements DogGatherCommentService{
	
	@Autowired
	private DogGatherCommentMapper dogGatherCommentMapper;

	@Override
	public int insertComment(DogGatherCommentVO commentVO) {
		int res = dogGatherCommentMapper.insertComment(commentVO);
		return res;
	}

	@Override
	public DogGatherCommentVO getComment(Long commentID) {
		DogGatherCommentVO vo = dogGatherCommentMapper.getComment(commentID);
		return vo;
	}

	@Override
	public List<DogGatherCommentVO> getCommentList(Criteria cri, Long postID) {
		List<DogGatherCommentVO> list = dogGatherCommentMapper.getCommentList(cri, postID);
		return list;
	}

	@Override
	public int modifyComment(DogGatherCommentVO commentVO) {
		int res = dogGatherCommentMapper.modifyComment(commentVO);
		return res;
	}
	
	@Override
	public int getCommentCnt(Long postID) {
		int commentCnt = dogGatherCommentMapper.getCommentCount(postID);
		return commentCnt;
	}

	@Override
	public int removeCommet(Long commentID) {
		int res = dogGatherCommentMapper.removeComment(commentID);
		return res;
	}


}