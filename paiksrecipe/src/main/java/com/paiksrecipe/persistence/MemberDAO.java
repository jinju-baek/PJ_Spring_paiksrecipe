package com.paiksrecipe.persistence;

import com.paiksrecipe.domain.MemberDTO;

public interface MemberDAO {
	// 회원가입 ID중복체크(+AJAX)
	public int idOverLap(String id);
	
	// 회원가입 DB에 회원 등록
	public int memInsert(MemberDTO mDto);
	
	// 회원수정 DB에 회원 수정
	public int memUpdate(MemberDTO mDto);
	
	// 회원가입 진행시 난수 생성 및 useyn 컬럼에 난수 입력
	public int getKey(String id, String key);
	
	// 회원가입 이메일 인증 후 useyn 컬럼 y로 값 변경
	public int alterKey(String id, String key);
	
	// 1명의 회원정보 
	public MemberDTO userView(String id);
}
