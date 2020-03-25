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

}
