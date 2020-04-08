package com.paiksrecipe.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class UploadFileUtils {
	public static String uploadFile(String uploadPath, String originalName, byte[] fileData) throws Exception {
		// 사용자별 uuid 발급
		UUID uid = UUID.randomUUID();
		// uid + 파일명
		String savedName = uid.toString() + "_" + originalName;
		// 업로드할 디렉토리 생성(해당 날짜로 폴더를 생성)
		String savedPath = calcPath(uploadPath);
		// uploadPath(d드라이브 아래의 저장 폴더) + savedPath(해당 날짜 폴더) + savedName(uuid)
		File target = new File(uploadPath + savedPath, savedName);
		// 임시 디렉토리에 업로드된 파일을 지정된 디렉토리로 복사
		// fileData(파일명), target(경로)
		FileCopyUtils.copy(fileData, target);
		// 파일의 확장자 검사
		// a.jpg / aaa.bbb.ccc.jpg
		String formatName = originalName.substring(originalName.lastIndexOf(".") + 1);
		String uploadedFileName = null;
		// 이미지 파일은 썸네일 사용
		// uploadPath : C:/developer/upload 
		// savedPath : /2020/04/08
		// savedName : uuid_abc.txt
		if (MediaUtils.getMediaType(formatName) != null) {
			//썸네일 생성
			uploadedFileName = makeThumbnail(uploadPath, savedPath, savedName);
		} else {
			uploadedFileName = makeIcon(uploadPath, savedPath, savedName);
		}
		return uploadedFileName;
	}
	
	private static String calcPath(String uploadPath) {
		Calendar cal = Calendar.getInstance();
		// 2020
		String yearPath = File.separator + cal.get(Calendar.YEAR);
		// /2020/04
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		// /2020/04/08
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		makeDir(uploadPath, yearPath, monthPath, datePath);
		log.info(datePath);
		return datePath;
	}
	
	// String... : 동일한 타입의 매개변수를 여러개(리스트로) 받을 경우 사용 
	// 동적으로 매개변수의 갯수가 바뀔 때 주로 사용
	private static void makeDir(String uploadPath, String... paths) {
		//디렉토리가 존재하면 skip
		if (new File(paths[paths.length - 1]).exists()) {
			return;
		}
		for (String path : paths) {
			File dirPath = new File(uploadPath + path);
			if (!dirPath.exists()) {
				dirPath.mkdir(); // 디렉토리 생성
			}
		}
	}
	
	private static String makeIcon(String uploadPath, String path, String fileName) throws Exception {
		// 아이콘 이름
		String iconName = uploadPath + path + File.separator + fileName;
		// 아이콘 이름을 리턴
		// File.separatorChar : 디렉토리 구분자(윈도우 \ , 유닉스(리눅스) /)
		// C:/developer/upload/2020/04/08/uuid_abc.txt
		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
	
	private static String makeThumbnail(String uploadPath, String path, String fileName) throws Exception {
		// 이미지를 읽기 위한 버퍼
		// 원본 이미지
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath + path, fileName));
		// 100픽셀 단위의 썸네일 생성
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);
		// 썸네일의 이름
		// C:/developer/upload/2020/04/08/s_uuid_abc.txt
		String thumbnailName = uploadPath + path + File.separator + "s_" + fileName;
		File newFile = new File(thumbnailName);
		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1); 
		// 썸네일 생성
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);
		// 썸네일의 이름을 리턴함
		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
	
	
}
