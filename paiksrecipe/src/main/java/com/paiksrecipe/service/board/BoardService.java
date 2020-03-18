package com.paiksrecipe.service.board;

import java.util.List;

import com.paiksrecipe.domain.BoardDTO;

public interface BoardService {
	
	// 게시글 개수 계산
	public int countArticle();
	
	// 게시글 목록
	public List<BoardDTO> listAll(int start, int end);
}
