package com.paiksrecipe.persistence;

import com.paiksrecipe.domain.MemberDTO;

public interface LoginDAO {
	
	// 로그인
	public MemberDTO loginUser(MemberDTO mDto);
	
}
