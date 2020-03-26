package com.paiksrecipe.service.reply;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.paiksrecipe.domain.ReplyDTO;
import com.paiksrecipe.persistence.ReplyDAO;

@Service
public class ReplyServiceImpl implements ReplyService{
	private ReplyDAO rDao;
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	public void ReplyDAO() {
		rDao = sqlSession.getMapper(ReplyDAO.class);
	}
	
	@Override
	public List<ReplyDTO> list(int bno) {
		return rDao.list(bno);
	}

	@Override
	public void insert(ReplyDTO rDto) {
		// 비즈니스 로직
		// 해당 게시글에 댓글을 등록하고,
		// 해당 게시글의 reply_cnt를 +1함.
		// 1. 댓글 등록
		rDao.insert(rDto);
		rDao.replyCntPlus(rDto.getBno());
		
	}

}
