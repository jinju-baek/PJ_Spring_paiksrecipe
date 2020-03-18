package com.paiksrecipe.persistence;

import java.util.List;

import com.paiksrecipe.domain.BoardDTO;

public interface BoardDAO {
	// 총 게시글 수
	public List<BoardDTO> listCnt();
	
	// 게시글 목록
	public List<BoardDTO> listAll();
}
