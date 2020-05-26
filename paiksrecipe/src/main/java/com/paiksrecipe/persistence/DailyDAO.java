package com.paiksrecipe.persistence;

import java.util.List;

import com.paiksrecipe.domain.DailyDTO;

public interface DailyDAO {
	// 등록, 조회, 수정, 삭제
	// 인터페이스에서는 abstract를 생략해도 추상메서드(실행문x)로 인식
	public void dailyCreate(DailyDTO dDto);
	public List<DailyDTO> dailyRead();
	public void dailyUpdate();
	public void dailyDelete();
	
}
