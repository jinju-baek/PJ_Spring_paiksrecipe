package com.paiksrecipe.service.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public int countArticle(String search_option, String keyword) {		
		Map<String, String> map = new HashMap<>();
		map.put("search_option", search_option);
		map.put("keyword", "%"+keyword+"%");
		return bDao.countArticle(map);
	}
	
	// 게시글 목록 출력
	@Override
	public List<BoardDTO> listAll(String sort_option, String search_option, String keyword, int start, int end) {		
		Map<String, Object> map = new HashMap<>();
		map.put("sort_option", sort_option);
		map.put("start", start);
		map.put("end", end);
		map.put("search_option", search_option);
		map.put("keyword", "%"+keyword+"%");
		return bDao.listAll(map);
	}

	@Override
	public BoardDTO view(int bno) {		
		return bDao.view(bno);
	}

}
