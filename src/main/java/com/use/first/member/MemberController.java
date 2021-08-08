package com.use.first.member;

import java.io.File;
import java.io.IOException;
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
import org.springframework.web.multipart.MultipartFile;

import com.use.first.paging.Criteria;
import com.use.first.paging.PageMaker;
import com.use.first.rent.RentDAO;
import com.use.first.rent.RentVO;

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
		List<RentVO> lateList = rentDAO.lateList();
		
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
				session.setAttribute("lateList", lateList);
				// return "/enterance/adminIndex";
				return "redirect:/adminIndex";
			} else {
				return "/enterance/adminLogin";
			}

		} else {
			return "/enterance/adminLogin";
		}
	}
	
	
	
	@RequestMapping(value = "/adminLogout", method = RequestMethod.GET)
	public String adminLoginout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
	
	
	

	
	

	@RequestMapping(value = "/adminIndex", method = RequestMethod.GET)
	public String adminIndex(UserVO vo, Model model) {
		model.addAttribute("user", vo);

		return "/enterance/adminIndex";
	}

	@RequestMapping(value = "/admin/mem/memList", method = RequestMethod.GET)
	public String adminMemList(Model model, Criteria cri) {
		 UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);

	      // 현재 페이지에 해당하는 게시물을 조회해 옴
		 List<UserVO> list = dao.memList(cri);
	      // 모델에 추가
		 model.addAttribute("memList", list);
	      // PageMaker 객체 생성
		 PageMaker pageMaker = new PageMaker(cri);
	      // 전체 게시물 수를 구함
	
	      int totalCount = dao.countMemListTotal(cri) - 1;
	      // pageMaker로 전달
	      pageMaker.setTotalCount(totalCount);
	      // 모델에 추가
	      model.addAttribute("pageMaker", pageMaker);
	      return "/admin/mem/memList";

	}
	
	
	
	
	 @RequestMapping(value = "/admin/mem/memList", method = RequestMethod.POST)
	   public String adminMemListSearch(Criteria cri, Model model) {
		 UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);

	      // 현재 페이지에 해당하는 게시물을 조회해 옴
		 List<UserVO> list = dao.memList(cri);
		 System.out.println(list.toString());
	      // 모델에 추가
		 model.addAttribute("memList", list);
	      // PageMaker 객체 생성
		 PageMaker pageMaker = new PageMaker(cri);
	      // 전체 게시물 수를 구함
	
	      int totalCount = dao.countMemListTotal(cri) - 1;
	      // pageMaker로 전달
	      pageMaker.setTotalCount(totalCount);
	      // 모델에 추가
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
	      UserDAO userDAO = sqlSessionTemplate.getMapper(UserDAO.class);
	      RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);
	      
	      //User 정보 가져오기
	      System.out.println("adminMenDetailByPath() // 들어가서 유저정보");
	      UserVO userVO = userDAO.memInfo(m_id);

	      // 대여 정보 가져오기

	      System.out.println("adminMenDetailByPath() // 들어가서 대여정보");

	      List<RentVO> rentList = rentDAO.rentListByMid(m_id, "구매");
	      System.out.println("rentList size : " + rentList.size());
	      // 구매 정보 가져오기
	      System.out.println("adminMenDetailByPath() // 들어가서 구매정보");

	      List<RentVO> purchaseList = rentDAO.purchaseListByMid(m_id, "구매");
	      System.out.println("purchaseList size : " + purchaseList.size());
	      model.addAttribute("userVO", userVO);
	      model.addAttribute("rentList", rentList);
	      model.addAttribute("purchaseList", purchaseList);
	      
	      return "/admin/mem/memDetail";
	   }

	   @RequestMapping(value = "/admin/mem/memDetail/{userID}", method = RequestMethod.POST)
	   public String adminMenUpdateByPath(Model model, UserVO userVO, @PathVariable String userID) throws IOException{
	      System.out.println("시작 전"+userVO.toString());
	      UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);
	      //파일 업로드
	      MultipartFile uploadFile =userVO.getUploadFile();
	      if(!uploadFile.isEmpty()) {
	         userVO.setM_img(uploadFile.getOriginalFilename());
	         uploadFile.transferTo(new File("C:\\FinalProject\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\UFO\\resources\\Images\\member\\"+userVO.getM_img()));
	      }

	      int n = dao.memUpdate(userVO);
	      System.out.println("시작 후"+userVO.toString());
	      if (n != 1) {
	         // 업데이트 실패 시
	         System.out.println("adminMenUpdateByPath // member 수정 실패 // " + userVO.toString());
	      }

	      return "redirect:/admin/mem/memDetail/" + userID;
	   }
	   // 성훈 end

}
