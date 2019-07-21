package com.community.petish.dog.missingboard.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.community.petish.dog.missingboard.dto.DogLostPostRequestWriteDTO;
import com.community.petish.dog.missingboard.dto.DogLostPostResponseDetailDTO;
import com.community.petish.dog.missingboard.dto.DogLostPostResponseListDTO;
import com.community.petish.dog.missingboard.service.DogLostPostService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@RequestMapping("/dog/missingboard/*")
@Controller
//@RestController
//@Log4j

public class DogMissingboardController {

	@Autowired
	private DogLostPostService service;

	// 게시글 리스트
	@RequestMapping("/list")
	public String dogMissingBoardList(Model model) throws ParseException {

		List<DogLostPostResponseListDTO> dtoList = service.getPostList();

		model.addAttribute("dtoList", dtoList);

		return "petish/dog/missingboard/list";
	}

	// 게시글 조회
	@RequestMapping("/detail/{id}")
	public String dogMissingBoardDetail(@PathVariable Long id, Model model) {

		DogLostPostResponseDetailDTO dto = service.getPostDetail(id);

		model.addAttribute("dto", dto);

		return "petish/dog/missingboard/detail";

	}

	// 게시글 입력 폼
	@RequestMapping("/writeForm")
	public String dogMissingBoardWriteForm() {
		return "petish/dog/missingboard/write_form";

	}

	// 게시글 입력
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String Register(DogLostPostRequestWriteDTO dto, HttpServletRequest request, Model model,
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
			System.out.println("날짜 : " + multi.getParameter("DOG_LOST_DATE"));

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

			System.out.println("Result : " + res);

		} catch (Exception e) {
			e.printStackTrace();
		}

		if (res == 1) {
			rttr.addFlashAttribute("msg", "success");
			return "redirect:/dog/missingboard/list";
		} else {
			rttr.addFlashAttribute("msg", "fail");
			return "redirect:/dog/missingboard/list";
		}
	}

	// 개시글 수정 폼
	@RequestMapping(value="/modifyForm/{id}")
	public String dogMissingBoardModifyForm(@PathVariable Long id, Model model) {

		DogLostPostResponseDetailDTO dto = service.getPostDetail(id);

		model.addAttribute("dto", dto);

		return "petish/dog/missingboard/modify_form";
	}

	// 게시글 수정
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String dogMissingBoardModify(DogLostPostRequestWriteDTO dto) {

		service.modify(dto);

		return "redirect:/dog/missingboard/list";
	}

	// 게시글 삭제
	@RequestMapping("/delete/{id}")
	public String dogMissingBoardDelete(@PathVariable Long id, RedirectAttributes rttr) {

		int result = service.delete(id);

		if (result == 1) {
			rttr.addFlashAttribute("delete_msg", "success");
		}

		else {
			rttr.addFlashAttribute("delete_msg", "failure");
		}

		return "redirect:/dog/missingboard/list";
	}

}