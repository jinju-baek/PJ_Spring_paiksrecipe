package com.paiksrecipe.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.paiksrecipe.domain.BoardDTO;
import com.paiksrecipe.service.board.BoardService;
import com.paiksrecipe.service.board.Pager;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/board")
public class BoardContorller {

	@Autowired
	BoardService bService;
	
	@GetMapping("/list")
	public String list(@RequestParam(defaultValue="1") int curPage, Model model) {
		log.info("★★★★★★★★★★★★★★★ GET: BOARD List PAGE");

		log.info("curPage= "+curPage);
		// 게시글 개수 계산
		int count = bService.countArticle();
		
		// 페이지 관련 설정
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();

		List<BoardDTO> list = bService.listAll(start, end); // 게시물 목록
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("count", count);
		map.put("list", list);
		map.put("pager", pager);
		
		model.addAttribute("map", map);
		
		log.info(pager.toString());
		return "board/list";
	}
}
