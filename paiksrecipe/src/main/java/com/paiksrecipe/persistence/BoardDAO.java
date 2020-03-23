package com.paiksrecipe.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.paiksrecipe.domain.BoardDTO;

public interface BoardDAO {
	// 총 게시글 수
	public int countArticle(@Param("map") Map<String, String> map);
	
	// 게시글 목록(페이지 나누기, 검색 기능 포함)
	public List<BoardDTO> listAll(@Param("map") Map<String, Object> map);
	
	public BoardDTO view(int num);
}
