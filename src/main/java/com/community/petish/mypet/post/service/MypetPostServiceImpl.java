package com.community.petish.mypet.post.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.community.petish.mypet.post.dto.request.SaveMypetPostParams;
import com.community.petish.mypet.post.dto.response.MypetPostDetailResponse;
import com.community.petish.mypet.post.dto.response.MypetPostSummary;
import com.community.petish.mypet.post.dto.response.MypetPostSummaryList;
import com.community.petish.mypet.post.mapper.MypetPostMapper;
import com.community.petish.user.dto.response.LoginedUser;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service("mypetPostService")
public class MypetPostServiceImpl implements MypetPostService{
	
	@Autowired
	MypetPostMapper mypetPostMapper;

	@Override
	public Long savePost(MultipartHttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		LoginedUser user = (LoginedUser) session.getAttribute("LOGIN_USER");
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		List<MultipartFile> files = request.getFiles("file");
		Long userId = user.getId();
		
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/img/mypet/");
		log.info("사진 업로드 요청", files.size(), "장");
		log.info(uploadPath, "로 업로드");
		
		List<String> imgFileNames = new ArrayList<>();
		
		for (MultipartFile file : files) {
			String fileName = file.getOriginalFilename();
			String originalFileExtension = fileName.substring(fileName.lastIndexOf("."));
			String storedFileName = UUID.randomUUID().toString().replace("-",  "") + originalFileExtension;
			
			if (file.getSize() != 0) {
				file.transferTo(new File(uploadPath + storedFileName));
				imgFileNames.add("/resources/img/mypet/" + storedFileName);
			}
			
		}
		
		String images = String.join(",", imgFileNames);

		SaveMypetPostParams saveMypetPostParams = new SaveMypetPostParams(title, content, images, userId);
		
		log.info("saveMypetPostParams = {}", saveMypetPostParams);
		
		Long postId = mypetPostMapper.save(saveMypetPostParams);
		
		return postId;
		
	}

	@Override
	public MypetPostDetailResponse getPost(Long postId) {
		log.info("mypet post 조회 요청 postId={}", postId);
		MypetPostDetailResponse mypetPostDetailResponse = mypetPostMapper.findById(postId);
		log.info("mypet post 조회 완료 postDetail = {}", mypetPostDetailResponse);
		return mypetPostDetailResponse;
	}

}
