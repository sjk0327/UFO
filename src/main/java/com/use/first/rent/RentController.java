package com.use.first.rent;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.use.first.buy.BuyDAO;
import com.use.first.buy.BuyVO;
import com.use.first.member.UserDAO;
import com.use.first.member.UserVO;
import com.use.first.paging.Criteria;
import com.use.first.paging.PageMaker;
import com.use.first.product.ProductDAO;
import com.use.first.product.ProductVO;

@Controller
public class RentController {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

//	@RequestMapping(value ="/adminsite/adminRentDetail/{r_id}", method = RequestMethod.GET)
//	public String getRental(Model model, @PathVariable String r_id) {
//		RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);
//		System.out.println(r_id);
//		RentVO rentVO = rentDAO.rentInfo(r_id);
//		System.out.println(rentVO);
//		model.addAttribute("rentInfo", rentVO);
//		return "admin/rent/admin_rentDetail";
//	}

	@RequestMapping(value = "/admin/rent/rentList", method = RequestMethod.GET)
	public String adminRentList(Criteria cri, Model model) {
		RentDAO rentdao = sqlSessionTemplate.getMapper(RentDAO.class);

		// 현재 페이지에 해당하는 게시물을 조회해 옴
		List<RentVO> list = rentdao.rentList(cri);
		// 모델에 추가
		model.addAttribute("rentList", list);
		// PageMaker 객체 생성
		PageMaker pageMaker = new PageMaker(cri);
		// 전체 게시물 수를 구함
		int totalCount = rentdao.getRentTotalCount(cri);
		// pageMaker로 전달
		pageMaker.setTotalCount(totalCount);
		// 모델에 추가
		model.addAttribute("pageMaker", pageMaker);
		return "/admin/rent/admin_rentList";
	}

	@RequestMapping(value = "/admin/rent/rentList", method = RequestMethod.POST)
	public String adminRentListSearch(Criteria cri, Model model) {
		RentDAO rentdao = sqlSessionTemplate.getMapper(RentDAO.class);

		// 현재 페이지에 해당하는 게시물을 조회해 옴
		List<RentVO> list = rentdao.rentList(cri);
		// 모델에 추가
		model.addAttribute("rentList", list);
		// PageMaker 객체 생성
		PageMaker pageMaker = new PageMaker(cri);
		// 전체 게시물 수를 구함
		int totalCount = rentdao.getRentTotalCount(cri);
		// pageMaker로 전달
		pageMaker.setTotalCount(totalCount);
		// 모델에 추가
		model.addAttribute("pageMaker", pageMaker);
		return "/admin/rent/admin_rentList";
	}

	@RequestMapping(value = "/admin/rent/rentDetail/{r_id}", method = RequestMethod.GET)
	public String adminRentDetail(Model model, @PathVariable String r_id) {
		RentDAO rentdao = sqlSessionTemplate.getMapper(RentDAO.class);
		RentVO rentVO = rentdao.rentInfo(r_id);
		model.addAttribute("rentDetail", rentVO);
		return "/admin/rent/admin_rentDetail";
	}

	@RequestMapping("/adminsite/adminRentDetail/{r_id}")
	public String getRental(Model model, @PathVariable String r_id) {
		RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);
		UserDAO userDAO = sqlSessionTemplate.getMapper(UserDAO.class);
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		BuyDAO buyDAO = sqlSessionTemplate.getMapper(BuyDAO.class);

		RentVO rentVO = rentDAO.rentInfo(r_id);
		UserVO userVO = userDAO.memInfo(rentVO.getR_mid());
		ProductVO productVO = productDAO.productInfo(rentVO.getR_pid());
		List<BuyVO> buyList = buyDAO.buyList(rentVO.getR_mid(), rentVO.getR_pid());

		model.addAttribute("rentInfo", rentVO);
		model.addAttribute("memInfo", userVO);
		model.addAttribute("proInfo", productVO);
		model.addAttribute("buyList", buyList);
		return "admin/rent/admin_rentDetail";
	}

}
