package com.paiksrecipe.service.login;

import javax.servlet.http.HttpSession;

import com.paiksrecipe.domain.MemberDTO;

public interface LoginService {
	// 로그인
	public int login(MemberDTO mDto, HttpSession session);
	
	// 로그아웃
	public void logout();
}
