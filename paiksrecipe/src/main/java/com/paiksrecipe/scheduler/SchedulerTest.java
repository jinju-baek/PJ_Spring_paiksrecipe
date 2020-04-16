package com.paiksrecipe.scheduler;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class SchedulerTest {
	
	// cron 표기법(초 분 시 일 월 년)
	// @Scheduled(cron = "0 7 10 * * *")
	public void cronTest() {
		log.info("Welcome Scheduling:)");
	}
}
