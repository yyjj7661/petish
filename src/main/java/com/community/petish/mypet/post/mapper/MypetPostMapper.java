package com.community.petish.mypet.post.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.community.petish.mypet.post.domain.MypetPost;
import com.community.petish.mypet.post.domain.MypetPostLike;
import com.community.petish.mypet.post.dto.request.SaveMypetPostParams;
import com.community.petish.mypet.post.dto.response.MypetPostDetailResponse;
import com.community.petish.mypet.post.dto.response.MypetPostLikeResponse;

public interface MypetPostMapper {

	Long savePost(SaveMypetPostParams saveMypetPostParams);
	
	List<MypetPost> findAll();
	
	Long countLikes(Long postId);
	
	Long countComments(Long postId);
	
	MypetPostDetailResponse findById(Long postId);
	
	MypetPostLike findIsLikePressedOnPost(@Param("postId") Long postId, @Param("userId") Long userId);
	
	List<MypetPostLikeResponse> findLikesByPostId(Long postId);
	
	Long saveLike(@Param("postId") Long postId, @Param("userId") Long userId);
	
	Long updateLikeNotDeleted(@Param("postId") Long postId, @Param("userId") Long userId);
	
	Long updateLikeDeleted(@Param("postId") Long postId, @Param("userId") Long userId);
	
}
