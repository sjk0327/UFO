package com.use.first.product;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class CookieBox {
	// 쿠키 객체를 생성하고 저장하고, 저장된 쿠키를 꺼내쓰는 기능
	
	// Cookie 객체를 저장하는 Map 객체를 생성
	Map<String, Cookie> cookieMap = new HashMap<String, Cookie>();
	// 초기화 : cookieMap에 cookie 데이터를 저장
	// 생성자 :
	public CookieBox(HttpServletRequest request) {
	// request를 통해 cookie 정보를 얻을 수 있다.
	Cookie[] cookies = request.getCookies();
	if(cookies!=null && cookies.length>0) {
		for(int i=0; i<cookies.length; i++) {
	// cookieMp에 Cookie 객체를 저장
		cookieMap.put(cookies[i].getName(), cookies[i]);
		}
	  }
	}
	// 이름으로 쿠키 객체를 반환
	public Cookie getCookie(String name) {
		return cookieMap.get(name);
		}
	// 이름으로 쿠키의 저장값을 반환
	public String getValue(String name) throws IOException {
		Cookie cookie = cookieMap.get(name); // Map에 name키가 업으면 null 반환
		if(cookie==null) {
			return null;
		}
		return URLDecoder.decode(cookie.getValue(),"UTF-8");
	}
	// cookieMap에 특정 이름의 쿠키가 존재하는지 여부 확인
	public boolean exists(String name) {
		return cookieMap.get(name) != null;
	}
	// 쿠기 객체를 생성해주는 메소드 : 객체를 생성하지 않고도 사용할 수 있는 메소드로 정의 : static 멤버로 정의
	// 오버로딩
	// 이름, 값을 가지고 cookie 객체 생성
	public static Cookie createCookie(String name, String value) {
		Cookie cookie = new Cookie(name, value);
		return cookie;
	}
	// 이름, 값, 경로, 유지시간을 가지고 cookie 객체 생성
	public static Cookie createCookie(
		String name, String value, String path, int maxAge) {
		
		Cookie cookie = new Cookie(name, value);
		cookie.setPath(path); // 경로 설정
		cookie.setMaxAge(maxAge); // 쿠기 유지시간 설정(24로 설정하기!)
		return cookie;
	}
	// 이름, 값, 경로, 유지시간, 도메인을 가지고 cookie 객체 생성
	public static Cookie createCookie(
		String name, String value, String path, int maxAge, String domain) {
		Cookie cookie = new Cookie(name, value);
		cookie.setPath(path); // 경로 설정
		cookie.setMaxAge(maxAge); // 쿠기 유지시간 설정
		cookie.setDomain(domain); // 쿠키 도메인 설정
		return cookie;
		}
	}


	

