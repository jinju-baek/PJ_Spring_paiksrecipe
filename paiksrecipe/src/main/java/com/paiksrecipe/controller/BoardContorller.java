package com.paiksrecipe.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board")
public class BoardContorller {

	@GetMapping("/list")
	public String list() {
		log.info("★★★★★★★★★★★★★★★ BOARD PAGE 출력");
		
		return "board/list";
	}
}
