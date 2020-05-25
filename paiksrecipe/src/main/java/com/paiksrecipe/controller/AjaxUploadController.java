package com.paiksrecipe.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.paiksrecipe.service.board.BoardService;
import com.paiksrecipe.util.MediaUtils;
import com.paiksrecipe.util.UploadFileUtils;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AjaxUploadController {
	
	@Autowired
	BoardService bService;
	
	// 의존성 주입(Autowired(Spring), Inject(Java) : 타입으로 의존성 주입 / Resource : 이름으로 의존성 주입)
	// 업로드 디렉토리 servlet-context.xml에 설정되어 있음
	@Resource(name="uploadPath")
	String uploadPath;

	// Upload File 멀티파트파일에 Save
	// 파일시스템, DB작업시에는 예외처리를 꼭 해줌
	// ResponseEntity : 
	@ResponseBody
	@RequestMapping(value="/upload/uploadAjax", produces="text/plain;charset=utf-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file) throws Exception {
														// file = 사용자가 드래그앤드롭한 첨부파일
		// uploadPath : 파일경로 
		// file.getOriginalFilename() : 순수파일이름
		// file.getBytes() : 파일크기(byte)
		// HttpStatus.OK : 성공했다는 코드를 보내줌
		// 업로드한 파일 정보와 Http상태 코드를 함께 리턴
		// UploadFileUtils : static
		// 스트림 : 연속해서(나눠서) 입력받는 데이터
		return new ResponseEntity<String>(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()), HttpStatus.OK);
	}
	
	// 이미지 표시 기능
	@ResponseBody // view가 아닌 data 리턴
	@RequestMapping("/upload/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception {
		//서버의 파일을 다운로드하기 위한 스트림
		InputStream in = null; // java.io
		ResponseEntity<byte[]> entity = null;
		try {
			// 확장자 검사
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			// 헤더 구성성 객체
			HttpHeaders headers = new HttpHeaders();
			// InputStream 생성
			in = new FileInputStream(uploadPath + fileName);
			// if (mType != null) { // 이미지 파일이면
			//	headers.setContentType(mType);
			// } else { // 이미지가 아니면
			fileName = fileName.substring(fileName.indexOf("_") + 1);
			// 다운로드용 컨텐트 타입
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			// 큰 따옴표 내부에 " \" 
			// 바이트배열을 스트링으로
			// iso-8859-1 서유럽언어
			// new String(fileName.getBytes("utf-8"), "iso-8859-1")
			headers.add("Content-Disposition", "attachment; filename=\"" + new String(fileName.getBytes("utf-8"), "iso-8859-1") + "\"");
			//headers.add("Content-Disposition"
			// , "attachment; filename='"+fileName+"'");
			// }
			// 바이트 배열, 헤더
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			if (in != null)
				in.close(); // 스트림 닫기
		}
		return entity;
	}
	
	@ResponseBody
	@PostMapping("/upload/deleteAllFile")
	public ResponseEntity<String> deleteFile(@RequestParam("files[]") String[] files) {
		log.info("delete all files : " + files);

		if(files == null || files.length == 0) {
			return new ResponseEntity<String>("deleted", HttpStatus.OK);
		}
		
		for(String fileName : files) {
			
			// fileName = /2020/04/10/s_ca6412fe-c76a-469f-87c4-c8fb032c39de_005_004.png
			// 확장자 검사
			String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
			// formatName = jpg
			MediaType mType = MediaUtils.getMediaType(formatName);

			if(mType != null) { // 이미지 파일이면 원본이미지 삭제
				String front = fileName.substring(0, 12);
				// front = /2020/04/10/
				String end = fileName.substring(14);
				// end = ca6412fe-c76a-469f-87c4-c8fb032c39de_005_004.png
				// File.separatorChar : 유닉스 / 윈도우즈 \
				new File(uploadPath + (front + end).replace('/', File.separatorChar)).delete();
				// new File(c://developer/upload + /2020/04/10/ + ca6412fe-c76a-469f-87c4-c8fb032c39de_005_004.png)
				// replace >> c:\\developer\ upload + \2020\04\10\ + ca6412fe-c76a-469f-87c4-c8fb032c39de_005_004.png
				// delete >> c:\\developer\ upload + \2020\04\10\ + ca6412fe-c76a-469f-87c4-c8fb032c39de_005_004.png
				// 원본이미지만 삭제
			}
			
			// 원본 파일 삭제(이미지이면 썸네일 삭제)
			new File(uploadPath + fileName.replace('/', File.separatorChar)).delete();
			// new File(c://developer/upload/2020/04/10/s_ca6412fe-c76a-469f-87c4-c8fb032c39de_005_004.png)
			// replace >> c:\\developer\ upload\2020\04\10\s_ca6412fe-c76a-469f-87c4-c8fb032c39de_005_004.png)
			// delete >> c:\\developer\ upload\2020\04\10\s_ca6412fe-c76a-469f-87c4-c8fb032c39de_005_004.png)
		}
		// ResponseEntity : request를 처리하고 response할 때 response설정을 미세하게 변경할 때 사용
		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}
}
