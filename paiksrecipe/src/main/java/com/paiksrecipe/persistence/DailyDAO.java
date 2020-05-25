package com.paiksrecipe.persistence;

import com.paiksrecipe.domain.DailyDTO;

public interface DailyDAO {
	// 등록, 조회, 수정, 삭제
	// 인터페이스에서는 abstract를 생략해도 추상메서드로 인식
	public void dailyCreate(DailyDTO dDto);
	public void dailySelect();
	public void dailyUpdate();
	public void dailDelete();
	
}
