package com.use.first.rent;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.use.first.buy.BuyDAO;
import com.use.first.buy.BuyVO;
import com.use.first.member.UserDAO;
import com.use.first.member.UserVO;
import com.use.first.message.MessageDAO;
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

	
//	@RequestMapping(value = "/admin/rent/rentList", method = RequestMethod.GET)
//	public String adminRentList(RentVO vo, Model model) {
//		RentDAO rentdao = sqlSessionTemplate.getMapper(RentDAO.class);
//		List<RentVO> list = rentdao.rentList(vo);
//		System.out.println(list.toString());
//		model.addAttribute("rentList", list);
//		return "/admin/rent/admin_rentList";
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
		return "/admin/rent/adminRentList";
	}
//
//	@RequestMapping(value = "/admin/rent/rentList", method = RequestMethod.POST)
//	public String adminRentListSearch(RentVO vo, Model model) {
//		RentDAO rentdao = sqlSessionTemplate.getMapper(RentDAO.class);
//		List<RentVO> list = rentdao.rentList(vo);
//		model.addAttribute("rentList", list);
//		System.out.println(list.toString());
//		return "/admin/rent/admin_rentList";
//	}
//	
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
		return "/admin/rent/adminRentList";
	}





	@RequestMapping("/admin/rent/rentDetail/{r_id}")
	public String getRental(Model model, @PathVariable int r_id,Criteria cri) {
		RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);
		UserDAO userDAO = sqlSessionTemplate.getMapper(UserDAO.class);
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		BuyDAO buyDAO = sqlSessionTemplate.getMapper(BuyDAO.class);
		MessageDAO messageDAO = sqlSessionTemplate.getMapper(MessageDAO.class);
		PageMaker pageMaker = new PageMaker(cri);
		
		RentVO rentVO = rentDAO.rentInfo(r_id);
		List<RentVO> returnList = rentDAO.returnList();
		UserVO userVO= userDAO.memInfo(rentVO.getR_mid());
		ProductVO productVO=productDAO.productInfo(rentVO.getR_pid());
		List<BuyVO> buyList=buyDAO.buyList(rentVO.getR_mid(), rentVO.getR_pid());
		Integer messageCount=messageDAO.findMessage(r_id);
		
		model.addAttribute("rentInfo", rentVO);
		model.addAttribute("memInfo", userVO);
		model.addAttribute("proInfo", productVO);
		model.addAttribute("buyList", buyList);
		model.addAttribute("messageCount", messageCount);
		model.addAttribute("pageMaker", pageMaker);
		return "admin/rent/adminRentDetail";
	}

	
	//반납 요청 처리
	@RequestMapping(value = "/admin/rent/returnConfirm")
	public String adminRentReturnConfirm(@RequestParam int r_id, Model model,HttpSession session) {
		RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);	
		rentDAO.rentReturn(r_id);
		List<RentVO> returnList = rentDAO.returnList();
		model.addAttribute("r_id",r_id);
		session.setAttribute("returnList", returnList);
		return "redirect:/admin/rent/rentDetail/"+r_id;
	}
	
	//세션값 재설정
	@RequestMapping(value = "/admin/rent/Findreturnlate")
	public String adminFindreturnlate(HttpSession session) {
		RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);	
		List<RentVO> returnList = rentDAO.returnList();
		List<RentVO> lateList = rentDAO.lateList();
		session.setAttribute("lateList", lateList);
		return "redirect:/adminIndex";

	}
	
	//연체 시 메세지 처리
	@RequestMapping(value = "/admin/rent/sendLateMessage")
	public void adminSendLateMessage(@RequestParam int r_id,Model model, HttpServletResponse response) throws Exception{
		RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);
		MessageDAO messageDAO = sqlSessionTemplate.getMapper(MessageDAO.class);
		System.out.println(r_id);
		RentVO rentVO = rentDAO.rentInfo(r_id);
		String r_mid=rentVO.getR_mid();
		messageDAO.sendMessage(r_id, r_mid);
		response.setContentType("text/html; charset=UTF-8");
		 
		PrintWriter out = response.getWriter();
		 
		out.println("<script language='javascript'>");
		out.println("alert('메세지 전송이 완료되었습니다!')");
		out.println("window.location='/admin/rent/rentDetail/"+r_id+"'");
		out.println("</script>");
		out.flush();
		
	}
	
	//정노
	@RequestMapping(value = "/member/rent/buy/{p_id}/{m_id}", method = RequestMethod.GET)
	public String adminProductDetail(Model model, @PathVariable String p_id, @PathVariable String m_id) {
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		UserDAO userDAO = sqlSessionTemplate.getMapper(UserDAO.class);
		
		
		UserVO userVO = userDAO.memInfo(m_id);
		ProductVO productVO = productDAO.productInfo(p_id);
		
		model.addAttribute("userVO", userVO);
		model.addAttribute("productVO", productVO);
		return "member/rent/buy";
	}
	

}
