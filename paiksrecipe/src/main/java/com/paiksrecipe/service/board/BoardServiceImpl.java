package com.paiksrecipe.service.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

	// 상세게시글 출력
	@Override
	public BoardDTO view(int bno) {		
		return bDao.view(bno);
	}

	// 조회수 +1 증가
	@Override
	public void increaseViewCnt(HttpSession session, int bno) {
		long update_time = 0; // 조회수 +1 증가한 시간
		
		if(session.getAttribute("update_time_"+bno) != null) {
			// 최근에 조회수를 올린 시간
			update_time = (long)session.getAttribute("update_time_"+bno);
		}
		
		long current_time = System.currentTimeMillis(); // 초단위로 변경되어 저장
		
		// 일정시간이 경과한 후 조회수 증가 처리
		if(current_time - update_time > 24*60*60*1000) {
			// DB에서 조회수 +1 증가
			bDao.increaseViewCnt(bno);
			// 조회수 올린 시간 저장
			session.setAttribute("update_time_"+bno, current_time);
		}
		
	}

	// 상세게시글 삭제
	@Override
	public void delBoard(int bno) {
		bDao.delBoard(bno);
	}

	// 게시글 등록
	@Transactional
	@Override
	public void write(BoardDTO bDto) {
		// tbl_board에 게시글 등록(type, title, content, writer)
		bDao.write(bDto);
		
		// tbl_attach에 해당 게시글 첨부파일 등록
		String[] files = bDto.getFiles();
		
		if(files == null) {
			return; // 첨부파일 없음, 종료
		}
		for(String name : files) {
			// tbl_attach 테이블에 첨부파일 1건씩 등록
			bDao.addAttach(name); 
		}
	}
	
	// 게시글 수정
	@Override
	public void update(BoardDTO bDto) {
		bDao.update(bDto);
		
	}

}
