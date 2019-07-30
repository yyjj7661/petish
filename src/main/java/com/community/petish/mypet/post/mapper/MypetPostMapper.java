package com.community.petish.mypet.post.mapper;

import org.apache.ibatis.annotations.Param;

import com.community.petish.mypet.post.domain.MypetPostLike;
import com.community.petish.mypet.post.dto.request.SaveMypetPostParams;
import com.community.petish.mypet.post.dto.response.MypetPostDetailResponse;

public interface MypetPostMapper {

	Long savePost(SaveMypetPostParams saveMypetPostParams);
	
	MypetPostDetailResponse findById(Long postId);
	
	MypetPostLike findIsLikePressedOnPost(@Param("postId") Long postId, @Param("userId") Long userId);
	
	Long saveLike(@Param("postId") Long postId, @Param("userId") Long userId);
	
	Long updateLikeNotDeleted(@Param("postId") Long postId, @Param("userId") Long userId);
	
	Long updateLikeDeleted(@Param("postId") Long postId, @Param("userId") Long userId);
	
}
