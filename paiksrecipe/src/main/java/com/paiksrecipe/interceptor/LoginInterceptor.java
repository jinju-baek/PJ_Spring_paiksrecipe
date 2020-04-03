
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
		// 이동하기 전 있었던 Page URL
		String referer = request.getHeader("referer");
		log.info("★★★★★★★★★★★★★★★ 이전 url : " + referer);
		// 이동하려고 했던 Page URL
		String uri = request.getRequestURI();
		String ctx = request.getContextPath();
		String nextUrl = uri.substring(ctx.length());
		String prevUrl = "";
		String finalUrl = "http://localhost:8081/paiksrecipe/";
		
		// 비정상적인 접근을 막는 기능
		if(referer == null) {
			log.info("★★★★★★★★★★★★★★★ WARNING>> 비정상적인 접근 :(");
			response.sendRedirect(finalUrl);
			return false;
		} else {
			int indexQuery = referer.indexOf("?");
			if(indexQuery == -1) {
				prevUrl = referer.substring(finalUrl.length()-1);
			} else {
				prevUrl = referer.substring(finalUrl.length()-1, indexQuery);
			}
			log.info("★★★★★★★★★★★★★★★ PREV URL" + prevUrl);
			log.info("★★★★★★★★★★★★★★★ NEXT URL" + nextUrl);
			
			if(nextUrl.equals("/board/update") || nextUrl.equals("/board/delete")) {
				log.info("★★★★★★★★★★★★★★★ 상세게시글 여부 : " + prevUrl.indexOf("board/view"));
				// 1. 상세게시글 (board/view) -> 수정게시글 페이지(board/update) bno 전송(title x)
				// 2. 수정게시글 페이지(board/update) -> 수정DB작업(board/update) bDto 전송(title o)
				// 둘다 비정상접근으로 인식하므로 2번 경우만 제외
				if(request.getParameter("title") == null) {
					if(prevUrl.indexOf("board/view") == -1) {
						log.info("★★★★★★★★★★★★★★★ WARNING>> 비정상적인 접근 :(");
						response.sendRedirect(finalUrl);
						return false;
					}
				}
			}
		}
		
		// 정상적인 접근인 경우 실행
		if(session.getAttribute("userid") == null) { 
			if(prevUrl.equals(nextUrl)) {
				log.info("★★★★★★★★★★★★★★★ WRANING>> prevUrl == nextUrl :/");
				response.sendRedirect(finalUrl);
				return false;
			}
			
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
