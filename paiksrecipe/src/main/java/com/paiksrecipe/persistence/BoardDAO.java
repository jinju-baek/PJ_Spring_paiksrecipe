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
	
	// 조회수 +1증가
	public void increaseViewCnt(@Param("bno") int bno);
	
	// 상세게시글 출력
	public BoardDTO view(int bno);
	
	// 상세게시글 삭제
	public void delBoard(@Param("bno") int bno);

	// 게시글 등록
	public void write(BoardDTO bDto);

	// 게시글 수정
	public void update(BoardDTO bDto);

	// 첨부파일 등록
	public void addAttach(@Param("fullName") String fullName);
	
	// 첨부파일 목록
	public List<String> getAttach(@Param("bno") int bno);

	// 첨부파일 삭제
	public void deleteAttach(@Param("bno") int bno);
	
}
