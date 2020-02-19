package com.paiksrecipe.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.paiksrecipe.domain.MemberDTO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/member")
@Controller
public class MemberController {
	@GetMapping("/constract")
	public String viewConstract() {
		log.info(">>>>> MEMBER/CONSTRACT PAGE 출력");
		return "member/constract";
	}
	@GetMapping("/join")
	public String viewJoin(MemberDTO mDto) {
		log.info(">>>>> MEMBER/JOIN PAGE GET 출력");
		log.info(mDto.toString());
		return "member/join";
	}
}
