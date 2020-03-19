
/*
 * Login이 필요한 기능 수행시
 * Session 체크를 하는 Interceptor 
 */


package com.paiksrecipe.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.servlet.support.RequestContextUtils;

import lombok.extern.slf4j.Slf4j;
@Slf4j
public class LoginInterceptor extends HandlerInterceptorAdapter{
	// URL 전
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// Session 객체 생성
		HttpSession session = request.getSession();
		
		// Login NO
		if(session.getAttribute("userid") == null) { 
			log.info("★★★★★★★★★★★★★★★ NOLOGIN :<");
			// 이전 페이지의 url을 get
			// referer : 바로 직전에 머물렀던 url 주소로, http header에 존재
			String referer = request.getHeader("referer");
			log.info("★★★★★★★★★★★★★★★ 이전 url : " + referer);
			
			// url만 신경씀, GET or POST 여부는 중요하지 않음
			// 회원수정페이지 : GET:/member/update
			// 회원수정DB작업 : POST:/member/update
			// reqeust(GET, POST) > response(forward, sendRedirect)
			
			// url로 데이터를 전달받을 경우 사용자가 로그인창을 꺼버리고 
			// 새로고침을 하면 로그인 창이 또 뜨므로 url로 전달하면 안됨
			// response.sendRedirect(referer+"?message=nologin");
			
			// FlashAttribute는 Controller영역에서만 사용할 수 없기때문에
			// 전신(부모)인 FlashMap을 활용 (redirectAttribute랑 똑같다고 생각하면 됨)
			FlashMap fMap = RequestContextUtils.getOutputFlashMap(request);
			fMap.put("message", "nologin");
			
			// url로 직접 접근시 referer에 null값이 들어오므로 값을 직접 입력
			if(referer == null) {
				referer = "http://localhost:8081/paiksrecipe/";
			}
			RequestContextUtils.saveOutputFlashMap(referer, request, response);
			response.sendRedirect(referer);
			
			return false; // 이동 x
		} else { // Login OK
			log.info("★★★★★★★★★★★★★★★ LOGIN :>");
			return true; // 원래 가려던 곳으로 이동
		}
	}
	
	/*
	 * // URL 후
	 * @Override public void postHandle(HttpServletRequest request,
	 * HttpServletResponse response, Object handler, ModelAndView modelAndView)
	 * throws Exception { // TODO Auto-generated method stub
	 * super.postHandle(request, response, handler, modelAndView); 
	 * }
	 */
	
}
