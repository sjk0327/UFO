package com.use.first.member;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.use.first.rent.RentDAO;
import com.use.first.rent.RentVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class MemberController {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	// 승빈 start
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String adminLogin(UserVO user, Model model) {
		model.addAttribute("user", user);
		return "/enterance/adminLogin";
	}

	@RequestMapping(value = "/admin", method = RequestMethod.POST)
	public String adminLogin(UserVO vo, Model model, HttpSession session) {
		model.addAttribute("user", vo);
		RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);
		List<RentVO> returnList = rentDAO.returnList();
		
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
				session.setAttribute("returnList", returnList);
				// return "/enterance/adminIndex";
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
	public String adminMemList(Model model, Criteria cri) {
		UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);
		List<UserVO> list = dao.memList(cri);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(dao.countMemListTotal());

		model.addAttribute("memList", list);
		model.addAttribute("pageMaker", pageMaker);

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

	@RequestMapping(value = "/admin/mem/memDetail/{m_id}", method = RequestMethod.GET)
	public String adminMenDetailByPath(Model model, @PathVariable String m_id) {
		// User 정보 가져오기
		System.out.println("adminMenDetailByPath() // 들어가서 유저정보");
		UserDAO userDAO = sqlSessionTemplate.getMapper(UserDAO.class);
		UserVO userVO = userDAO.memInfo(m_id);

//		// 대여 정보 가져오기
//		RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);
//		RentVO rentVO = new RentVO();
//		rentVO.setR_mid(m_id);
//		String r_state = "구매";
//		rentVO.setR_state(r_state);
//		System.out.println("adminMenDetailByPath() // 들어가서 대여정보");
//		List<RentVO> rentList = rentDAO.simpleRentList(rentVO);
//
//		System.out.println("rentList size : " + rentList.size());
//		// 구매 정보 가져오기
//		System.out.println("adminMenDetailByPath() // 들어가서 구매정보");
//
//		List<RentVO> buyList = rentDAO.simpleBuyList(rentVO);
//		System.out.println("buyList size : " + buyList.size());
//
		model.addAttribute("userVO", userVO);
//		model.addAttribute("rentList", rentList);
//		model.addAttribute("buyList", buyList);  
		return "/admin/mem/memDetail";
	}

	@RequestMapping(value = "/admin/mem/memDetail/{userID}", method = RequestMethod.POST)
	public String adminMenUpdateByPath(Model model, UserVO userVO, @PathVariable String userID) {
		System.out.println(userVO.toString());
		UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);
		int n = dao.memUpdate(userVO);
		if (n != 1) {
			// 업데이트 실패 시
			System.out.println("adminMenUpdateByPath // member 수정 실패 // " + userVO.toString());
		}

		return "redirect:/admin/mem/memDetail/" + userID;
	}
	// 성훈 end

}
