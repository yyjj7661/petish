package com.community.petish.dog.missingboard.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.ParseException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.community.petish.dog.missingboard.domain.AttachFileVO;
import com.community.petish.dog.missingboard.dto.Criteria;
import com.community.petish.dog.missingboard.dto.DogLostPostPageDTO;
import com.community.petish.dog.missingboard.dto.DogLostPostRequestWriteDTO;
import com.community.petish.dog.missingboard.dto.DogLostPostResponseDetailDTO;
import com.community.petish.dog.missingboard.dto.DogLostPostResponseListDTO;
import com.community.petish.dog.missingboard.service.DogLostPostService;

import lombok.extern.slf4j.Slf4j;

@RequestMapping("/dog/missingboard/*")
@Controller
@Slf4j
public class DogMissingboardController {

	@Autowired
	private DogLostPostService service;
	
		
	@RequestMapping("/image")
	public String imageUpload() {
		return "petish/dog/missingboard/imageInput_form";
	}
	
	@RequestMapping(value = "/favicon.ico", method = RequestMethod.GET)
	public void favicon( HttpServletRequest request, HttpServletResponse reponse ) {

	try {
	  reponse.sendRedirect("/resources/favicon.ico");
	} catch (IOException e) {
	  e.printStackTrace();
	}
	}
	// 게시글 리스트
	//@RequestMapping("/list")
	/*
	public String dogMissingBoardList(Criteria cri, Model model) throws ParseException {

		List<DogLostPostResponseListDTO> dtoList = service.getPostList(cri);
		
		log.info("list : " + cri);
		model.addAttribute("dtoList", dtoList);
		
		int total = service.getPostCount(cri); //전체 게시글 수
		System.out.println("Total : " + total);
		System.out.println("cri.amount : " + cri.getAmount());
		System.out.println("cri.pageNum : " + cri.getPageNum());		
		System.out.println("dtoList 길이" + dtoList.size());		
		
		model.addAttribute("pageMaker",  new DogLostPostPageDTO(cri, total));
		
		return "petish/dog/missingboard/list";
	}
	*/
	
	//@RequestMapping("/list")
//	public void getList(Criteria cri, Model model) {
//		
//		log.info("list : " + cri);
//		
//		int total = service.getPostCount(cri); //전체 게시글 수
//		
//		model.addAttribute("list", service.getPostList(cri));
//		//model.addAttribute("pageMaker", new DogLostPostPageDTO(cri,total));
//		
//	}
	
	//게시글 리스트(페이징)
	@RequestMapping("/list")
	public String dogMissingBoardListPaging(Criteria cri, Model model) throws ParseException {

		cri.setPageNum(cri.getPageNum());
		log.info("num : " + cri.getPageNum());
		List<DogLostPostResponseListDTO> dtoList = service.getPostList(cri);		
		
		log.info("pageNum : " + cri.getPageNum());
		model.addAttribute("dtoList", dtoList);
		
		int total = service.getPostCount(cri); //전체 게시글 수
				
		System.out.println("Total : " + total);
		System.out.println("cri.amount : " + cri.getAmount());
		System.out.println("cri.pageNum : " + cri.getPageNum());		
		System.out.println("dtoList 길이" + dtoList.size());		
		
		model.addAttribute("pageMaker",  new DogLostPostPageDTO(cri, total));		
		model.addAttribute("pageNum", cri.getPageNum());
		
		return "petish/dog/missingboard/list";
	}
	
	// 게시글 조회
	@RequestMapping("/detail/{id}")
	public String dogMissingBoardDetail(@PathVariable Long id, Model model) {
		//조회 수 갱신
		service.updateViewCount(id);
		//조회
		DogLostPostResponseDetailDTO dto = service.getPostDetail(id);		
		
		model.addAttribute("dto", dto);

		return "petish/dog/missingboard/detail";
	}

	// 게시글 입력 폼
	@RequestMapping("/writeForm")
	public String dogMissingBoardWriteForm() {
		return "petish/dog/missingboard/write_form";
	}
	
	
	//입력
	@PostMapping("/register")
	public String register(DogLostPostRequestWriteDTO dto, Model model, RedirectAttributes rttr) {

		log.info("==========================");
		log.info("register: " + dto);		

		if (dto.getAttachList() != null) {
			dto.getAttachList().forEach(attach -> log.info(attach.toString()));
		}
		log.info("==========================");

		service.register(dto);
		
		rttr.addFlashAttribute("result", dto.getId());

		return "redirect:/petish/dog/missingboard/list";
	}

	// 게시글 입력
	/*
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	
	public String register(DogLostPostRequestWriteDTO dto, HttpServletRequest request, Model model,
			RedirectAttributes rttr) {

		int maxSize = 5 * 1024 * 1024;
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/dogLostPostUpload");
		List<String> saveFiles = new ArrayList();

		int res = 0; // 결과 저장

		try {
			MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, "UTF-8",
					new DefaultFileRenamePolicy());
			Enumeration<String> files = multi.getFileNames();

			while (files.hasMoreElements()) {
				String name = files.nextElement();
				if (files.hasMoreElements()) {
					saveFiles.add(multi.getFilesystemName(name) + ",");
				} else {
					saveFiles.add(multi.getFilesystemName(name));
				}
			}

			StringBuffer fl = new StringBuffer();
			for (int i = 0; i < saveFiles.size(); i++) {
				fl.append(saveFiles.get(i));
			}

			SimpleDateFormat transformat = new SimpleDateFormat("yyyy/MM/dd HH:mm"); // 변환할 Date 형식
			log.info("날짜 : " + multi.getParameter("DOG_LOST_DATE"));

			// dto.setID(Integer.parseInt(multi.getParameter("ID")));
			dto.setUSER_ID(Integer.parseInt(multi.getParameter("USER_ID")));

			dto.setDOG_NAME(multi.getParameter("DOG_NAME"));
			dto.setDOG_AGE(Integer.parseInt(multi.getParameter("DOG_AGE")));
			dto.setDOG_GENDER(multi.getParameter("DOG_GENDER"));
			dto.setDOG_DESCRIPTION(multi.getParameter("DOG_DESCRIPTION"));
			dto.setDOG_IMAGE(fl.toString());

			dto.setDOG_LOST_DATE(transformat.parse(multi.getParameter("DOG_LOST_DATE"))); // String -> Date 변환
			dto.setPHONE_NUMBER(multi.getParameter("PHONE_NUMBER"));
			dto.setDOG_LOST_ADDRESS(multi.getParameter("DOG_LOST_ADDRESS"));
			dto.setREWARD(Integer.parseInt(multi.getParameter("REWARD")));

			// dto.setFOUND
			dto.setUSER_ID(Integer.parseInt(multi.getParameter("USER_ID")));
			dto.setSPECIES_ID(Integer.parseInt(multi.getParameter("SPECIES_ID")));

			res = service.register(dto);

			model.addAttribute("dto", dto);

		} catch (Exception e) {
			e.printStackTrace();
		}

		if (res == 1) {
			log.info("입력 성공");
			rttr.addFlashAttribute("msg", "success");
			return "redirect:/dog/missingboard/list";
		} else {
			log.info("입력 실패");
			rttr.addFlashAttribute("msg", "fail");
			return "redirect:/dog/missingboard/list";
		}
	}
	*/

	// 개시글 수정 폼
	@RequestMapping(value="/modifyForm/{id}")
	public String dogMissingBoardModifyForm(@PathVariable Long id, Model model){
		
		DogLostPostResponseDetailDTO dto = service.getPostDetail(id);

		model.addAttribute("dto", dto);

		return "petish/dog/missingboard/modify_form";
	}

	// 게시글 수정
	@RequestMapping(value="/modify", method = RequestMethod.POST)
	public String dogMissingBoardModify(DogLostPostRequestWriteDTO dto, Model model, RedirectAttributes rttr) {
		
		log.info("게시글 수정");
		
		Long pageNum = dto.getId();
		
		try {
			
			int result = service.modify(dto);
			
			
			if(result == 1) {
				log.info("수정 성공");			
				//수정한 페이지 조회 화면으로 (수정하기)
				
			}
			else {
				log.info("수정 실패");
			}
		}
		
		catch(Exception e){
			log.info("에러");
			e.printStackTrace();			
		}
		return "redirect:/dog/missingboard/detail/"+pageNum;
	}
	
	// 게시글 삭제
	@RequestMapping("/delete/{id}")
	public String dogMissingBoardDelete(@PathVariable Long id, RedirectAttributes rttr) {

		log.info("게시글 삭제");
		
		List<AttachFileVO> attachList = service.getAttachList(id);
		
		int result = service.delete(id);
		log.info("result : " + result);
		
		if (result == 1) {
			
			//첨부파일 삭제
			deleteFiles(attachList);
			
			log.info("삭제 성공");
			rttr.addFlashAttribute("delete_msg", "success");
		}
		else {
			log.info("삭제 실패");
			rttr.addFlashAttribute("delete_msg", "failure");
		}
		return "redirect:/dog/missingboard/list";
	}
	
	// 첨부 파일 삭제
	private void deleteFiles(List<AttachFileVO> attachList) {
	    
	    if(attachList == null || attachList.size() == 0) {
	      return;
	    }
	    
	    log.info("delete attach files...................");
	    log.info(attachList.toString());
	    
	    attachList.forEach(attach -> {
	      try {        
	        //Path file  = Paths.get("C:\\upload\\"+attach.getUploadPath()+"\\" + attach.getUuid()+"_"+ attach.getFileName());
	        Path file  = Paths.get(attach.getUploadPath()+"\\" + attach.getUuid()+"_"+ attach.getFileName());	        
	        
	        Files.deleteIfExists(file);
	        
	        if(Files.probeContentType(file).startsWith("image")) {
	        
	          Path thumbNail = Paths.get("C:\\upload\\"+attach.getUploadPath()+"\\s_" + attach.getUuid()+"_"+ attach.getFileName());
	          
	          Files.delete(thumbNail);
	        }
	
	      }catch(Exception e) {
	        log.error("delete file error" + e.getMessage());
	      }//end catch
	    });//end foreachd
	  }

	
	// 첨부 파일 목록 조회	
	@GetMapping(value = "/getAttachList/{id}", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<AttachFileVO>> getAttachList(@PathVariable Long id) {
	
		log.info("getAttachList " + id);
	
		return new ResponseEntity<>(service.getAttachList(id), HttpStatus.OK);
	}
	

}