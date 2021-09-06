package com.use.first.visitor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.context.support.WebApplicationContextUtils;

public class VisitCounter implements HttpSessionListener{
   
   @Override
    public void sessionCreated(HttpSessionEvent event){
	   VisitCountDAO dao = getSessionService(event).getMapper(VisitCountDAO.class);
       VisitCountVO vo = new VisitCountVO();
      
        HttpServletRequest req = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
      
        vo.setVisit_ip(req.getRemoteAddr());
        vo.setVisit_agent(req.getHeader("User-Agent"));//브라우저 정보
        System.out.println("sessionCreated :: vo :" + vo.toString());
        dao.insertVisitor(vo);
    }
    @Override
    public void sessionDestroyed(HttpSessionEvent event){      
    }
    
    private SqlSessionTemplate getSessionService(HttpSessionEvent se) {
      WebApplicationContext context = WebApplicationContextUtils
            .getWebApplicationContext(se.getSession().getServletContext());
      return (SqlSessionTemplate) context.getBean("sqlSessionTemplate");
   }
   

}