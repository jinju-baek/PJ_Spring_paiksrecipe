package com.paiksrecipe.persistence;

import com.paiksrecipe.domain.MemberDTO;

public interface MemberDAO {
	public int idOverLap(String id);
	
	public int memInsert(MemberDTO mDto);
}
