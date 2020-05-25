package com.paiksrecipe.util;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.MediaType;

public class MediaUtils {
	// 메모리 => mediaMap 변수 공간
	// 				ㄴ HashMap() 구조를 만듦
	//						 KEY : VALUE
	// 					ㄴ 1)JPG
	//					ㄴ 2)GIF
	//					ㄴ 3)PNG
	// result : mediaMap안에 3개의 데이터(JPG, GIF, PNG) 저장
	
	private static Map<String, MediaType> mediaMap;
	// 클래스를 로딩할 때 제일 먼저 실행되는 코드
	// static{} => static 블록
	// static 블록 : 프로그램 시작과 동시에 실행되어 메모리에 상주하는 코드
	static {
		mediaMap = new HashMap<>();
		mediaMap.put("JPG", MediaType.IMAGE_JPEG);
		mediaMap.put("GIF", MediaType.IMAGE_GIF);
		mediaMap.put("PNG", MediaType.IMAGE_PNG);
	}
	public static MediaType getMediaType(String type) {
		// toUpperCase() 대문자로 변경
		// jpg => JPG
		return mediaMap.get(type.toUpperCase());
	}
	
}
