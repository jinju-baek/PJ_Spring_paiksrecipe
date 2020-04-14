package com.paiksrecipe.service.board;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.paiksrecipe.domain.BoardDTO;

public interface BoardService {
	
	// 게시글 개수 계산
	public int countArticle(String search_option, String keyword);
	
	// 게시글 목록
	public List<BoardDTO> listAll(String sort_option, String search_option, String keyword, int start, int end);
	
	// 조회수 +1증가
	public void increaseViewCnt(HttpSession session, int bno);
	
	// 상세게시글 출력
	public BoardDTO view(int bno);
	
	// 상세게시글 삭제
	public void delBoard(int bno);

	// 게시글 등록
	public void write(BoardDTO bDto);
	
	// 게시글 수정
 	public void updateBoard(BoardDTO bDto);

 	// 해당 게시글 첨부파일 목록 출력
	public List<String> getAttach(int bno);

}
