package com.paiksrecipe.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.paiksrecipe.domain.ReplyDTO;
import com.paiksrecipe.service.reply.ReplyService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/reply")
public class ReplyController {
	
	@Autowired
	private ReplyService rService;
	
	
	@GetMapping("/list")
	public String list(int bno, Model model) {
		log.info("★★★★★★★★★★★★★★★ GET : Reply List Page");
		
		model.addAttribute("list", rService.list(bno));
		return "/board/commentlist";
	}
	
	@ResponseBody
	@PostMapping("/insert")
	public void insert(ReplyDTO rDto) {
		log.info("★★★★★★★★★★★★★★★ POST : Reply Insert DB");
	
		rService.insert(rDto);
	}
}
