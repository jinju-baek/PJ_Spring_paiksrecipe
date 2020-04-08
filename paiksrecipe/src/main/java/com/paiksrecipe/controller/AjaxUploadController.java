package com.paiksrecipe.controller;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.paiksrecipe.service.board.BoardService;
import com.paiksrecipe.util.UploadFileUtils;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AjaxUploadController {
	
	@Autowired
	BoardService bService;
	
	// 업로드 디렉토리 servlet-context.xml에 설정되어 있음
	@Resource(name="uploadPath")
	String uploadPath;
	
	// GET으로 와도 POST로 가도록 설정
	// 파일 첨부 페이지로 이동
	@GetMapping("/upload/uploadAjax")
	public String uploadAjax() {
		return "/upload/uploadAjax";
	}

	// Upload File 멀티파트파일에 Save
	// 파일시스템, DB작업시에는 예외처리를 꼭 해줌
	// ResponseEntity : 
	@ResponseBody
	@PostMapping(value="/upload/uploadAjax", produces="text/plain;charset=utf-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception {
		// uploadPath : 파일경로 
		// file.getOriginalFilename() : 순수파일이름
		// file.getBytes() : 파일크기(byte)
		// HttpStatus.OK : 성공했다는 코드를 보내줌
		return new ResponseEntity<String>(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()), HttpStatus.OK);
	}
}
