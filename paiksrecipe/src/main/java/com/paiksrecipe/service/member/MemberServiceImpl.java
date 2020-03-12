package com.paiksrecipe.service.member;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.paiksrecipe.domain.MemberDTO;
import com.paiksrecipe.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	PasswordEncoder passwordEncoder;
	
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

	@Override
	public int pwCheck(String id, String pw) {
		String encPw = mDao.pwCheck(id);
		int result = 0;
		if(passwordEncoder.matches(pw, encPw)) {
			result = 1;
		}
		return result;
	}

	@Override
	public void pwUpdate(MemberDTO mDto) {
		mDao.pwUpdate(mDto);
	}

	@Override
	public void memDrop(HttpSession session, String id) {
		// 비즈니스로직(회원탈퇴)
		// 1) 해당 회원의 useyn을 n으로 update(DB)
		int result = mDao.memDrop(id);
		
		// 회원탈퇴 성공시 로그인 정보를 삭제 (session 초기화)
		if(result > 0) {
			session.invalidate();
		}
	}
}
