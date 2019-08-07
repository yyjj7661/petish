package com.community.petish.dog.gatherboard.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.community.petish.dog.gatherboard.domain.Criteria;
import com.community.petish.dog.gatherboard.domain.DogGatherCommentVO;
import com.community.petish.dog.gatherboard.dto.request.DogGatherCommentDTO;
import com.community.petish.dog.gatherboard.service.DogGatherCommentService;
import com.community.petish.dog.gatherboard.service.DogGatherService;

@RequestMapping("/dog/gatherboard")
@RestController
public class DogGatherCommentController {

	@Autowired
	private DogGatherService dogGatherService;
	
	@Autowired
	private DogGatherCommentService dogGatherCommentService;

	//댓글 전체 조회
	@RequestMapping(value="/commentList", method=RequestMethod.GET, produces="application/json;charset=UTF-8")
	@ResponseBody
	public String getCommetListJSON(Criteria cri, DogGatherCommentVO comment) {
		System.out.println("getCommentListJSON Start!!!!!!!!");
		System.out.println("pageNum="+cri.getPageNum());
		List<DogGatherCommentVO> commentVoList = dogGatherCommentService.getCommentList(cri, comment.getPOST_ID());
		
		List<DogGatherCommentDTO> commentDTOList = new ArrayList<DogGatherCommentDTO>();
		
		for(int i=0; i<commentVoList.size(); i++) {
			DogGatherCommentVO commentVO = commentVoList.get(i);
			
			//DELETED = 0 인 게시물만 보여준다
			if(commentVO.getDELETED()==0) {
				
				String username = dogGatherService.getUserName(commentVO.getUSER_ID()); 
				int count = dogGatherCommentService.getCommentCnt(comment.getPOST_ID());
				
				DogGatherCommentDTO dto = 
						new DogGatherCommentDTO(commentVO.getID(), count, username, commentVO.getCONTENT(), 
												commentVO.getCREATED_DATE(), commentVO.getUPDATED_DATE(), 
												commentVO.getDELETED(), commentVO.getPOST_ID());
				
				commentDTOList.add(dto);
			}
			
		}
		String str = "";
		
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(commentDTOList);
			System.out.println("str="+str);
		}
		catch(Exception e) {
			System.out.println("first() mapper:"+e.getMessage());
		}
		
		return str;
	}
	
	//댓글 조회
	@RequestMapping(value = "{id}", method=RequestMethod.GET, produces="application/json;charset=UTF-8")
	@ResponseBody
	public String getComment(@PathVariable("commentID") Long commentID) {
		
		DogGatherCommentVO commentVo = dogGatherCommentService.getComment(commentID);
		
		System.out.println("getCommentVO="+commentVo.toString());
		
		String str = "";
		
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(commentVo);
			System.out.println("str="+str);
		}
		catch(Exception e) {
			System.out.println("first() mapper:"+e.getMessage());
		}
		
		return str;
	}
	
	//댓글 추가
	@RequestMapping(value = "/insertComment", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> insertComment(DogGatherCommentVO commentVO) {
		Map<String, Object> retVal = new HashMap<String, Object>();
		try {
			int res = dogGatherCommentService.insertComment(commentVO);
			System.out.println("insetCommentRes="+res);
			retVal.put("res", "OK");
		}
		catch(Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
		}
		return retVal;
	}
	
	//댓글 수정
	@RequestMapping(method = { RequestMethod.PUT, RequestMethod.PATCH },
			value = "modifyComment/{commentID}",
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> modifyComment(@RequestBody DogGatherCommentVO commentVo, @PathVariable("commentID") Long commentID) {
		commentVo.setID(commentID);
		
		System.out.println("id="+commentVo.getID());
		System.out.println("modify="+commentVo.getCONTENT());
		
		return dogGatherCommentService.modifyComment(commentVo) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//댓글 삭제
	@RequestMapping(method = { RequestMethod.PUT, RequestMethod.PATCH },
			value = "removeComment/{commentID}",
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> removeComment(@PathVariable("commentID") Long commentID) {
		
		System.out.println("remove="+commentID);
		
		return dogGatherCommentService.removeCommet(commentID) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
}