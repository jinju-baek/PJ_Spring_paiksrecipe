package com.paiksrecipe.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.paiksrecipe.domain.BoardDTO;
import com.paiksrecipe.service.board.BoardService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board")
public class BoardContorller {

	@Autowired
	BoardService bService;
	
	@GetMapping("/list")
	public String list(Model model) {
		log.info("★★★★★★★★★★★★★★★ GET: BOARD List PAGE");
		
		model.addAttribute("listCnt", bService.listCnt()); // 총 게시글 수
		
		List<BoardDTO> list = bService.listAll(); // 게시물 목록
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("list", list);
		map.put("listCnt", bService.listCnt());
		model.addAttribute("map", map);
		
		return "board/list";
	}
}
