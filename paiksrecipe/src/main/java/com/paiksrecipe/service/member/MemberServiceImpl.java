package com.paiksrecipe.service.member;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.paiksrecipe.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private SqlSession sqlSession;
	
	private MemberDAO mDao;
	@Autowired
	public void newMemberDAO() {
		mDao = sqlSession.getMapper(MemberDAO.class);
	}
	
	@Override
	public int idOverlap(String id) {
		return mDao.idOverLap(id);
	}
}
