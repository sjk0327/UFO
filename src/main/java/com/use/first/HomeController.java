package com.use.first;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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

		model.addAttribute("serverTime", formattedDate);

		return "home";
	}

	
	// 임시로 붙여본 것 (나중에 지우기)
	@RequestMapping(value = "/adminsite", method = RequestMethod.GET)
	public String admin(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		return "admintest";
	}

	// 승빈 start
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String adminLogin(UserVO user, Model model) {
		model.addAttribute("user", user);
		return "/enterance/adminLogin";
	}

	@RequestMapping(value = "/admin", method = RequestMethod.POST)
	public String adminLogin(UserVO vo, Model model, HttpSession session) {
		model.addAttribute("user", vo);
		if (vo.getM_id() == null || vo.getM_id().equals("")) {
			return "/enterance/adminLogin";
		} else if (vo.getM_pw() == null || vo.getM_pw().equals("")) {
			return "/enterance/adminLogin";
		}

		UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);
		UserVO user = dao.memInfo(vo.getM_id());

		if (user != null && vo.getM_id().equals("admin")) {
			if (vo.getM_id().equals(user.getM_id()) && vo.getM_pw().equals(user.getM_pw())) {
				session.setAttribute("userName", user.getM_name());
				//return "/enterance/adminIndex";
				return "redirect:/adminIndex";
			} else {
				return "/enterance/adminLogin";
			}

		} else {
			return "/enterance/adminLogin";
		}
	}
	
	@RequestMapping(value = "/adminIndex", method = RequestMethod.GET)
	public String adminIndex(UserVO vo, Model model) {
		model.addAttribute("user", vo);
		
		return "/enterance/adminIndex";
	}
	
	@RequestMapping(value = "/admin/mem/memList", method = RequestMethod.GET)
	public String adminMemList(Model model) {
		UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);
		List<UserVO> list = dao.memList();
		model.addAttribute("memList", list);

		return "/admin/mem/memList";
	}
	// 승빈 end
	
	// 성훈 start
	@RequestMapping(value = "/admin/mem/memDetail", method = RequestMethod.GET)
	public String adminMenDetail(Model model, @RequestParam String m_id) {
		System.out.println("admin/mem/memDetail // 들어가서 처음");
		UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);
		UserVO userInfo = dao.memInfo(m_id);
		
		model.addAttribute("userInfo", userInfo);
		
		return "/admin/mem/memDetail";
	}
	@RequestMapping(value = "/admin/mem/memDetail/selectID/{userID}", method = RequestMethod.GET)
	public String adminMenDetailByPath(Model model, @PathVariable String userID) {
		UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);
		UserVO userInfo = dao.memInfo(userID);
		
		model.addAttribute("userInfo", userInfo);
		
		return "/admin/mem/memDetail";
	}
	
	@RequestMapping(value = "/admin/mem/memUpdate", method = RequestMethod.POST)
	public String adminMenUpdate(Model model, UserVO user) {
		UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);
		int n = dao.memUpdate(user);
		if(n != 1) {
			//업데이트 실패 시
			
		}
		
		return "redirect:/admin/mem/memDetail?userID="+user.getM_id();
	}
	@RequestMapping(value = "/admin/mem/memUpdate/selectID/{userID}", method = RequestMethod.POST)
	public String adminMenUpdateByPath(Model model, UserVO user, @PathVariable String userID) {
		UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);
		int n = dao.memUpdate(user);
		if(n != 1) {
			//업데이트 실패 시
			
		}
		
		return "redirect:/admin/mem/memDetail/selectID/"+userID;
	}
	// 성훈 end
	
	
	
	
	

}
