package com.paiksrecipe.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.paiksrecipe.controller.IndexController;
import com.paiksrecipe.service.index.IndexService;

import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
public class IndexController {
	// @Inject, @Autowired, @Resource중 1개라도 붙어있으면 의존성 주입

	// @Inject와 @Atuowired는 타입(변수타입)으로 의존성 주입
	// 타입으로 가져오기때문에 IndexService 이 부분이 중요하지 iService는 중요x
	// IndexService는 인터페이스... IndexService, IndexServiceImpl도 가능함 왜냐면 타입으로 의존해서
	// @Resource는 변수명으로 의존성 주입
	
	@Autowired
	IndexService iService;
	// iService에 indexServiceImpl Beans가 들어가있는것
	
	@RequestMapping("/")
	public String indexView(Model model) {
		log.info(">>>>> INDEX PAGE 출력");
		
		// 2. View단에 출력할 베스트 상품 5건
		model.addAttribute("BestPdt", iService.bestPdtList()); // 이름표, 담을 데이터
		
		// 2. View단에 출력할 신상품 5건
		// 신상품 5건을 출력하는 비즈니스 로직을 처리하는
		// 서비스단으로 이동
		model.addAttribute("NewPdt", iService.newPdtList());
		
		// 2. 출력할 화면을 결정
		// 3. Dispatcher Servlet으로 이동
		
		// DispatcherServlet
		// 1. Model(BestPdt)
		// 2. View(/WEB-INF/views/index.jsp)
		// >>> index.jsp 화면단으로 Model(BestPdt) 전송
		return "index";
	}
	
}
