package com.use.first;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.use.first.member.UserDAO;
import com.use.first.member.UserVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String admin(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "adminLogin";
	}

	
	
	
//
//	@RequestMapping(value = "/adminMemList", method = RequestMethod.GET)
//	public String adminMenList(Locale locale, Model model) {
//		
//		model.addAttribute("serverTime", formattedDate );
//		
//		return "adminMenList";
//	}
//	
//	
	
	
	@RequestMapping(value="/admin", method=RequestMethod.GET)
	public String adminLogin(UserVO user, Model model) {
		model.addAttribute("user", user);
		return "/enterance/adminLogin";
	}
	
	
	
	@RequestMapping(value="/admin", method=RequestMethod.POST)
	public String adminLogin(UserVO vo, HttpSession session) {
		if(vo.getM_id() == null || vo.getM_id().equals("")) {
			System.out.println("여기까지");
			throw new IllegalArgumentException("아이디는 반드시 입력해야 합니다.");
		}
		UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);
		UserVO user = dao.memInfo(vo.getM_id());

		if(user != null) {
			session.setAttribute("userName", user.getM_id());
			return "/admin/mem/adminMenList";
		} else {
			return "/enterance/adminLogin";
		}
	}
	
	
	

	
	
	
	
	
	
	
	
	
	
	
}
