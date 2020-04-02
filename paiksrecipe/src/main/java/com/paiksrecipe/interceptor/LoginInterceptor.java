
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
		
		// 이전 페이지의 url을 get
		// referer : 바로 직전에 머물렀던 url 주소로, http header에 존재
		String referer = request.getHeader("referer");
		log.info("★★★★★★★★★★★★★★★ 이전 url : " + referer);
		
		// Login NO
		if(session.getAttribute("userid") == null) { 
			log.info("★★★★★★★★★★★★★★★ NOLOGIN :<");
		
			// 
			String uri = request.getRequestURI();
			log.info("★★★★★★★★★★★★★★★ 목적지 : " + uri);
			
			if(referer == null) {
				// URL로 바로 접근한 경우(외부, referer이 없는 경우)
				referer = "http://localhost:8081/paiksrecipe/";
			} else {
				// 내부에서 접근한 경우(referer이 있는 경우)
				// 게시글 등록, 수정(로그인이 필요한 view단)
				int index = referer.lastIndexOf("/");
				int len = referer.length();
				log.info("★★★★★★★★★★★★★★★ 인덱스 : " + index);
				log.info("★★★★★★★★★★★★★★★ 길이 : " + len);
				String mapWord = referer.substring(index, len);
				log.info("★★★★★★★★★★★★★★★ 수정된 URL : " + mapWord);
				log.info("★★★★★★★★★★★★★★★ 이전 URL : " + referer);
				log.info("★★★★★★★★★★★★★ : " + mapWord.indexOf("/update"));
				
				
				if(mapWord.equals("/write")) {
					response.sendRedirect(request.getContextPath() + "/board/list");
					return false; // 이동 x
				}else if(mapWord.indexOf("/update") == 0) {
					response.sendRedirect(request.getContextPath() + "/board/list");
					return false;
				}
			}
						
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
			fMap.put("uri", uri);
			
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
