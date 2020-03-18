package com.paiksrecipe.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.paiksrecipe.domain.BoardDTO;

public interface BoardDAO {
	// 총 게시글 수
	public int countArticle();
	
	// 게시글 목록
	public List<BoardDTO> listAll(@Param("map") Map<String, Object> map);
}
