package com.community.petish.community.dog.missingboard.service;

import java.util.List;

import com.community.petish.community.dog.missingboard.domain.AttachFileVO;
import com.community.petish.community.dog.missingboard.dto.Criteria;
import com.community.petish.community.dog.missingboard.dto.DogLostPostRequestWriteDTO;
import com.community.petish.community.dog.missingboard.dto.DogLostPostResponseDetailDTO;
import com.community.petish.community.dog.missingboard.dto.DogLostPostResponseListDTO;
import com.community.petish.community.dog.missingboard.mapper.AttachFileMapper;
import com.community.petish.community.dog.missingboard.mapper.DogLostPostMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class DogLostPostServiceImpl implements DogLostPostService{
	
	@Autowired
	private DogLostPostMapper mapper;
	
	@Autowired
	private AttachFileMapper attachMapper;
	
	//게시글 수
	@Override
	public int getPostCount(Criteria cri) {
		return mapper.getPostCount(cri);
	}
	
	//게시글 리스트
	@Override
	public List<DogLostPostResponseListDTO> getPostList(Criteria cri){
		
		System.out.println("[Service]Cri : " + cri);
		
		return mapper.getDogLostList(cri);
	}
	
	//게시글 리스트(페이징)
	/*
	 * public List<DogLostPostResponseListDTO> getListWithPaging(Criteria cri){
	 * 
	 * System.out.println("[Service]Cri : " + cri);
	 * 
	 * 
	 * return mapper.getListWithPaging(cri); }
	 */

	// 게시글 조회
	@Override
	public DogLostPostResponseDetailDTO getPostDetail(Long id) {
		return mapper.getPostDetail(id);
	}
	
	// 게시글 조회 수 갱신
	public int updateViewCount(Long id) {
		return mapper.updateViewCount(id);
	}

	// 게시글 작성
	@Transactional
	@Override
	public void register(DogLostPostRequestWriteDTO dto) {
		
		System.out.println("[Service] register");

		mapper.insertPost(dto); //게시글 저장
		
		if(dto.getAttachList() == null || dto.getAttachList().size() <=0 ) {
			return;
		}
		
		try {
			
		dto.getAttachList().forEach(attach -> {
			
			System.out.println("[UUID]" + attach.getUuid());
			System.out.println("[attach] : " + attach);			
			
			Long id = dto.getId();			
			attach.setPostId(id);
			
			System.out.println("[PostId()]" + attach.getPostId());
			
			attachMapper.insert(attach); //사진 저장
		});		
		
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 게시글 수정
	@Override	
	public int modify(DogLostPostRequestWriteDTO dto) {		
		System.out.println("[Service] 수정 dto : " + dto.getDog_name());
		System.out.println("[Service] 수정 dto : " + dto.getDog_description());
		
		attachMapper.deleteAll(dto.getId());

		int result = mapper.updatePost(dto);
		
		if(result == 1 && dto.getAttachList().size() > 0) {
			dto.getAttachList().forEach(attach -> {
				attach.setPostId(dto.getId());
				attachMapper.insert(attach);
			});			
		}
		
		return result;
	}
	
	//게시글 삭제
	@Transactional
	@Override
	public int delete(Long id) {
		
		attachMapper.deleteAll(id); //첨부 사진 삭제 
		
		return mapper.deletePost(id); //게시글 삭제
	}
	
	//사진 첨부
	@Override
	public List<AttachFileVO> getAttachList(Long postId) {

		System.out.println("get Attach list by postId" + postId);

		return attachMapper.findByPostId(postId);
	}
	
}
