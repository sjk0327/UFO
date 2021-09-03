package com.use.first.visitor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.use.first.member.UserDAO;

public class VisitCounter implements HttpSessionListener {

	private VisitCountDAO dao;

	@Autowired
	SqlSessionTemplate template;

	public static int count;

	public static int getCount() {
		return count;
	}
	
	public void sessionCreated(HttpSessionEvent event) {

		// dao = template.getMapper(MemberDao.class);

		dao = getSessionService(event).getMapper(VisitCountDAO.class);

		// 세션이 만들어질 때 호출
		HttpSession session = event.getSession(); // request에서 얻는 session과 동일한 객체
		session.setMaxInactiveInterval(60 * 20);

		count++;

		session.getServletContext().log(session.getId() + " 세션생성 " + ", 접속자수 : " + count);

		HttpServletRequest req = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes())
				.getRequest();

		VisitCountVO vo = new VisitCountVO();
		System.out.println("ip" + req.getRemoteAddr());
		System.out.println("agent" + req.getHeader("User-Agent"));
		vo.setVisit_ip(req.getRemoteAddr());
		vo.setVisit_agent(req.getHeader("User-Agent"));// 브라우저 정보
		System.out.println("vo : " + vo);
		dao.insertVisitor(vo);
	}

	public void sessionDestroyed(HttpSessionEvent event) {
		// 세션이 소멸될 때 호출
		count--;
		if (count < 0)
			count = 0;

		HttpSession session = event.getSession();
		session.getServletContext().log(session.getId() + " 세션소멸 " + ", 접속자수 : " + count);
	}

	private SqlSessionTemplate getSessionService(HttpSessionEvent se) {
		WebApplicationContext context = WebApplicationContextUtils
				.getWebApplicationContext(se.getSession().getServletContext());
		return (SqlSessionTemplate) context.getBean("sqlSessionTemplate");
	}



}
