package com.use.first;

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

import com.use.first.member.UserInfoVO;
import com.use.first.product.ProductDAO;
import com.use.first.product.ProductVO;
import com.use.first.rent.RentDAO;
import com.use.first.visitor.VisitCountDAO;



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
		VisitCountDAO dao = sqlSessionTemplate.getMapper(VisitCountDAO.class);
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);
		
		String smartphoneBest="p_h001";
		String notebookBest="p_n001";
		String watchBest="p_w001";
		String tabletBest="p_t001";
		String cameraBest="p_c001";
		List<String> smartphoneList = productDAO.productReviewBest("h");
		if(smartphoneList.size()!=0) {
		smartphoneBest=smartphoneList.get(0);}
		List<String> notebookList = productDAO.productReviewBest("n");
		if(notebookList.size()!=0) {
		notebookBest=notebookList.get(0);}
		List<String> watchList = productDAO.productReviewBest("w");
		if(watchList.size()!=0) {
		watchBest=watchList.get(0);}
		List<String> tabletList = productDAO.productReviewBest("t");
		if(tabletList.size()!=0) {
		tabletBest=tabletList.get(0);}
		List<String> cameraList = productDAO.productReviewBest("c");
		if(cameraList.size()!=0) {
		cameraBest=cameraList.get(0);}
		
		ProductVO smartphone=productDAO.productInfo(smartphoneBest);
		ProductVO notebook=productDAO.productInfo(notebookBest);
		ProductVO smartwatch=productDAO.productInfo(watchBest);
		ProductVO tablet=productDAO.productInfo(tabletBest);
		ProductVO camera=productDAO.productInfo(cameraBest);
		model.addAttribute("smartphone", smartphone);
		model.addAttribute("notebook", notebook);
		model.addAttribute("smartwatch", smartwatch);
		model.addAttribute("tablet", tablet);
		model.addAttribute("camera", camera);
		if (session.getAttribute("userInfo") != null) {
			UserInfoVO user=(UserInfoVO)session.getAttribute("userInfo");
			if(!user.getM_name().equals("?????????")) {
				System.out.println("! ?????? ?????????");
				String userId=user.getM_id();
				int count = rentDAO.countCart(userId);
				System.out.println(count+"??????");
				session.setAttribute("count",count);
				return "home";
			}
			else {
				System.out.println("! ????????? ??????????????????");
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
	


	
	
	

	
	
	
	
	
	

}
