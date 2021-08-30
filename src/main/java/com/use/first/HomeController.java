package com.use.first;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
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
import org.springframework.web.bind.annotation.RequestParam;

import com.use.first.paging.Criteria;
import com.use.first.paging.PageMaker;
import com.use.first.product.ProductDAO;
import com.use.first.product.ProductVO;



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
	public String home(Locale locale, Model model, HttpSession session) {
		if (session.getAttribute("userName") != null) {
			System.out.println("home() userName : " + session.getAttribute("userName"));
			if(!session.getAttribute("userName").equals("관리자")) {
				System.out.println("! 이면 홈으로");
				return "home";
			}
			else {
				System.out.println("! 아니면 로그아웃으로");
				return "redirect:/logout";
			}
		} else {
			return "home";
		}

	}
	
	
	@RequestMapping(value = "/paytest")
	public String paytest(Locale locale, Model model, HttpSession session) {
		
			return "/member/rent/paytest";
		
	}
	
	@RequestMapping(value = "/payfail")
	public String payfail(Locale locale, Model model, HttpSession session) {
		
			return "/member/rent/payfail";
		

	}
	
	@RequestMapping(value = "/modaltest")
	public String modaltest(Locale locale, Model model, HttpSession session) {
		
			return "/member/rent/modaltestjsp";
		

	}

	
	//공지사항 컨트롤러 - 신영 구현중..
	@RequestMapping(value = "/member/pro/noticeList", method = RequestMethod.GET)
	public String noticeList(Model model, Criteria cri) {
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		

		return "member/pro/noticeList";
	}



	
	
	
	
	
	

}
