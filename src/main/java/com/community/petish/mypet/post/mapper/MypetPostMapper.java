package com.community.petish.mypet.post.mapper;

import java.util.List;

import com.community.petish.mypet.post.dto.request.SaveMypetPostParams;
import com.community.petish.mypet.post.dto.response.MypetPostDetailResponse;
import com.community.petish.mypet.post.dto.response.MypetPostSummary;

public interface MypetPostMapper {

	Long save(SaveMypetPostParams saveMypetPostParams);
	
}
