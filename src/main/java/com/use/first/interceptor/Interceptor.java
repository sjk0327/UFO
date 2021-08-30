package com.use.first.interceptor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class Interceptor extends HandlerInterceptorAdapter {
	private static final Logger logger = LoggerFactory.getLogger(Interceptor.class);

	static final String[] EXCLUDE_URL_LIST = {"adminLogin"};

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String reqUrl = request.getRequestURL().toString();
		
		System.out.println("Interceptor :: reqest URL : " + reqUrl);
		System.out.println("Interceptor :: getContextPath : " + request.getContextPath());
		/** 로그인체크 제외 리스트 */
		for(String target : EXCLUDE_URL_LIST) {
			if(reqUrl.indexOf(target) > -1) {
				System.out.println("Interceptor :: Exclude url list : In");
				return true;
			}
		}
		
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userName");
		
		if(userId == null || userId.trim().equals("") || userId.trim().equals("admin")) {
			logger.info(">> interceptor catch!! userId is null.. ");
			session.invalidate();
			
			response.sendRedirect("/adminLogin");
			return false;
		}
		return true;
	}
	
	
}
