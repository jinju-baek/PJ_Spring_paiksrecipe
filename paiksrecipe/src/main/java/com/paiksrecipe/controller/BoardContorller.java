package com.paiksrecipe.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	//
	// curPage : 어떤 페이지를 띄울것인지
	// sort_option : 정렬할 값
	// search_option : 검색 옵션
	// keyword : 검색어
	
	@GetMapping("/list")
	public String list(@RequestParam(defaultValue="1") int curPage, @RequestParam(defaultValue="new") String sort_option, 
			@RequestParam(defaultValue="all") String search_option, @RequestParam(defaultValue="") String keyword, Model model) {
		log.info("★★★★★★★★★★★★★★★ GET: BOARD List PAGE");
		
		// 게시글 개수 계산
		int count = bService.countArticle(search_option, keyword);
		
		// 페이지 관련 설정
		Pager pager = new Pager(count, curPage);
		int start = pager.getPageBegin();
		int end = pager.getPageEnd();

		List<BoardDTO> list = bService.listAll(sort_option, search_option, keyword, start, end); // 게시물 목록
		
		Map<String, Object> map = new HashMap<>();
		map.put("count", count);
		map.put("list", list);
		map.put("pager", pager);
		map.put("sort_option", sort_option);
		map.put("search_option", search_option);
		map.put("keyword", keyword);
		
		model.addAttribute("map", map);
		
		log.info(pager.toString());
		return "board/list";
	}
	
	@GetMapping("/view/{bno}")
	public String view(@PathVariable(value="bno") int bno, Model model, HttpSession session) {
		log.info("★★★★★★★★★★★★★★★ GET: BOARD VIEW PAGE");
		
		// 1. 해당 bno 조회수 +1 증가
		bService.increaseViewCnt(session, bno);
		
		// DB에서 해당 bno정보를 get해서 view단으로 전송
		model.addAttribute("one", bService.view(bno));
		model.addAttribute("key", "dropBoard");
		
		return "board/view";
	}
	
	@GetMapping("/delete")
	public String delete(int bno) {
		log.info("★★★★★★★★★★★★★★★ GET: BOARD DELETE ACTION");
		
		bService.delBoard(bno);
		
		return "redirect:/board/list";
	}
	
	@GetMapping("/write")
	public String register(HttpSession session, Model model) {
		log.info("★★★★★★★★★★★★★★★ GET: BOARD INSERT PAGE");
		
		model.addAttribute("userid", (String)session.getAttribute("userid"));
		model.addAttribute("name", (String)session.getAttribute("name"));
		
		return "/board/register";
	}
	
}
