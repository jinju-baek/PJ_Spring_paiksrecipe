package com.paiksrecipe.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.paiksrecipe.domain.MemberDTO;
import com.paiksrecipe.service.login.LoginService;

import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/login")
@Slf4j
@Controller
public class LoginController {
	
	@Autowired
	LoginService lService;
	
	@PostMapping("/in")
	public Integer logIn(MemberDTO mDto, HttpSession session) {
		log.info("★★★★★★★★★★★★★★★ POST: LOGIN/LOGIN ACTION");
		log.info(mDto.toString());
		// 로그인
		int result = lService.login(mDto, session);
		log.info("★★★★★★★★★★★★★★★ 결과는 " + result);
		
		return result;
	}
	
	@PostMapping("/out")
	public void logOut(HttpSession session) {
		log.info("★★★★★★★★★★★★★★★ POST: LOGOUT/LOGOUT ACTION");
		lService.logout(session);
	}
	
}
