package com.paiksrecipe.service.board;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.paiksrecipe.domain.BoardDTO;
import com.paiksrecipe.persistence.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private SqlSession sqlSession;
	
	private BoardDAO bDao;
	
	@Autowired
	public void newBoardDAO() {
		bDao = sqlSession.getMapper(BoardDAO.class);
	}
	
	// 총 게시글 수
	@Override
	public int countArticle() {		
		return bDao.countArticle();
	}
	
	// 게시글 목록 출력
	@Override
	public List<BoardDTO> listAll(int start, int end) {		
		HashMap<String, Object> map = new HashMap<>();
		map.put("start", start);
		map.put("end", end);
		
		return bDao.listAll(map);
	}

}
