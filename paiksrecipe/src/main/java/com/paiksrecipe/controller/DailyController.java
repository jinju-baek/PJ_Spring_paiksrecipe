package com.paiksrecipe.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.paiksrecipe.domain.DailyDTO;
import com.paiksrecipe.service.daily.DailyService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/daily")
public class DailyController {
	
	// ex) 등록 기능
	// 		ㄴ 1) 화면단 (view) - 메서드 1개
	// 		ㄴ 2) 실제 동작(Action) - 메서드 1개
	
	// 조회(1개의 메서드 필요-Action)	
	
	// 등록(1개의 메서드 필요-Action)
	
	// 수정(1개의 메서드 필요-Action)
	
	// 삭제(1개의 메서드 필요-Action)
	
	@Autowired
	DailyService dService;
	// DailyService ds = new DailyService();
	
	@GetMapping("/create")
	public void dailyAppend(DailyDTO dDto) {
		log.info("Daily Append:)");
		log.info(dDto.toString());
		dService.dailyCreate(dDto);
	}
	@GetMapping("/read")
	public void dailySelectAll() {
		log.info("Daily Select:)");
		dService.dailyRead();
	}
	@PostMapping("/update")
	public void dailyUpdate() {
		log.info("Daily Update:)");
		dService.dailyUpdate();
	}
	@GetMapping("/delete")
	public void dailyDelete() {
		log.info("Daily Delete:)");
		dService.dailyDelete();
	}
	
}
