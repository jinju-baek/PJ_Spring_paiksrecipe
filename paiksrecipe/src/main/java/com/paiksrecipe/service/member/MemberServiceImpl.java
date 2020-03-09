package com.paiksrecipe.service.member;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.paiksrecipe.domain.MemberDTO;
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

	@Override
	public int memInsert(MemberDTO mDto) {
		return mDao.memInsert(mDto);
	}

	@Override
	public MemberDTO userView(String id) {
		return mDao.userView(id);
	}

	@Override
	public void memUpdate(MemberDTO mDto, HttpSession session) {
		int result = mDao.memUpdate(mDto);
		
		if(result > 0) { // 수정 성공
			// 세션에 로그인유저 정보를 저장
			// .removeAttribute()써주는걸 권장
			session.removeAttribute("name");
			session.setAttribute("name", mDto.getName());
		}
	}
}
