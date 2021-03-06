package com.use.first.rent;

import java.io.PrintWriter;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.use.first.buy.BuyDAO;
import com.use.first.buy.BuyVO;
import com.use.first.member.UserDAO;
import com.use.first.member.UserInfoVO;
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

		// ?????? ???????????? ???????????? ???????????? ????????? ???
		List<RentVO> list = rentdao.rentList(cri);
		// ????????? ??????
		model.addAttribute("rentList", list);
		// PageMaker ?????? ??????
		PageMaker pageMaker = new PageMaker(cri);
		// ?????? ????????? ?????? ??????
		int totalCount = rentdao.getRentTotalCount(cri);
		// pageMaker??? ??????
		pageMaker.setTotalCount(totalCount);
		// ????????? ??????
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

		// ?????? ???????????? ???????????? ???????????? ????????? ???
		List<RentVO> list = rentdao.rentList(cri);
		// ????????? ??????
		model.addAttribute("rentList", list);
		// PageMaker ?????? ??????
		PageMaker pageMaker = new PageMaker(cri);
		// ?????? ????????? ?????? ??????
		int totalCount = rentdao.getRentTotalCount(cri);
		// pageMaker??? ??????
		pageMaker.setTotalCount(totalCount);
		// ????????? ??????
		model.addAttribute("pageMaker", pageMaker);
		return "/admin/rent/adminRentList";
	}

	@RequestMapping("/admin/rent/rentDetail/{r_id}")
	public String getRental(Model model, @PathVariable int r_id, Criteria cri) {
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
		List<BuyVO> buyList=buyDAO.buyList(rentVO.getR_id());
		Integer messageCount=messageDAO.findMessage(r_id);

		model.addAttribute("rentInfo", rentVO);
		model.addAttribute("memInfo", userVO);
		model.addAttribute("proInfo", productVO);
		model.addAttribute("buyList", buyList);
		model.addAttribute("messageCount", messageCount);
		model.addAttribute("pageMaker", pageMaker);
		return "admin/rent/adminRentDetail";
	}

	// ?????? ?????? ??????
	@RequestMapping(value = "/admin/rent/returnConfirm")
	public String adminRentReturnConfirm(@RequestParam int r_id, Model model, HttpSession session) {
		RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);
		rentDAO.rentReturn(r_id);
		List<RentVO> returnList = rentDAO.returnList();
		model.addAttribute("r_id", r_id);
		session.setAttribute("returnList", returnList);
		return "redirect:/admin/rent/rentDetail/" + r_id;
	}

	// ????????? ?????????
	@RequestMapping(value = "/admin/rent/Findreturnlate")
	public String adminFindreturnlate(HttpSession session) {
		RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);
		List<RentVO> returnList = rentDAO.returnList();
		List<RentVO> lateList = rentDAO.lateList();
		session.setAttribute("lateList", lateList);
		return "redirect:/adminIndex";

	}

	// ?????? ??? ????????? ??????
	@RequestMapping(value = "/admin/rent/sendLateMessage")
	public void adminSendLateMessage(@RequestParam int r_id, Model model, HttpServletResponse response)
			throws Exception {
		RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);
		MessageDAO messageDAO = sqlSessionTemplate.getMapper(MessageDAO.class);
		System.out.println(r_id);
		RentVO rentVO = rentDAO.rentInfo(r_id);
		String r_mid = rentVO.getR_mid();
		messageDAO.sendMessage(r_id, r_mid);
		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();

		out.println("<script language='javascript'>");
		out.println("alert('????????? ????????? ?????????????????????!')");
		out.println("window.location='/admin/rent/rentDetail/" + r_id + "'");
		out.println("</script>");
		out.flush();

	}

	// ???????????????
	@RequestMapping(value = "/customer/rent/wishList")
	public String customerwishList(HttpSession session, Model model) {

		System.out.println(session.getAttribute("userInfo")+"aaa");
		UserInfoVO userInfo=(UserInfoVO)session.getAttribute("userInfo");
		String userId=userInfo.getM_id();
		
		RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);
		List<WishListVO> wishList = rentDAO.getWishList(userId);
		model.addAttribute("wishList", wishList);
		return "/member/rent/memberWishList";
	}

	// ??????????????? ??????
	@RequestMapping(value = "/customer/rent/deleteWishList", method = RequestMethod.POST)
	public void customerDeleteWishList(@RequestParam("w_id") String w_id, Model model, HttpServletResponse response)
			throws Exception {
		RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);
		rentDAO.deleteWishList(w_id);

		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();

		out.println("<script language='javascript'>");
		out.println("alert('????????? ????????????????????? ?????????????????????!')");
		out.println("window.location='/customer/rent/wishList'");
		out.println("</script>");
		out.flush();
	}

	@RequestMapping(value = "/customer/rent/deleteWishList2", method = RequestMethod.GET)
	public void customerWishSelectDelete(@RequestParam HashMap<String, Object> commandMap, HttpServletResponse response)
			throws Exception {
		RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);

		String[] code_array = null;

		String code = commandMap.get("arrayParam").toString();
		// System.out.println("code:" + code);

		code_array = code.split(",");

		for (int i = 0; i < code_array.length; i++) {
			System.out.println("code_array[]::::" + code_array[i]);
			rentDAO.deleteWishList(code_array[i]);
		}

		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();

		out.println("<script language='javascript'>");
		out.println("alert('????????? ???????????? ????????????????????? ?????????????????????!')");
		out.println("window.location='/customer/rent/wishList'");
		out.println("</script>");
		out.flush();

	}

	// ??????????????? ?????? ??????
	@RequestMapping(value = "/customer/rent/deleteWishAll")
	public void customerDeleteWishAll(@RequestParam("userID") String w_mid, HttpServletResponse response)
			throws Exception {
		System.out.println(w_mid);
		RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);

		rentDAO.deleteWishAll(w_mid);

		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();

		out.println("<script language='javascript'>");
		out.println("alert('?????????????????? ?????? ???????????????!')");
		out.println("window.location='/customer/rent/wishList'");
		out.println("</script>");
		out.flush();

	}

	
	//????????????
		@RequestMapping(value = "/customer/rent/cartList")
		public String customercartList(HttpSession session, Model model) {
			UserInfoVO userInfo=(UserInfoVO)session.getAttribute("userInfo");
			String userId=userInfo.getM_id();
			RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);
			List<CartVO> cartList = rentDAO.getCartList(userId);	
			cartList.toString();
			model.addAttribute("cartList", cartList);
			return "/member/rent/memberCart";
		}
		
		
		//???????????? ?????? ??????
		@RequestMapping(value = "/customer/rent/deleteCartList", method = RequestMethod.POST)
		public void customerDeleteCartList(@RequestParam("c_id") String c_id, Model model,HttpServletResponse response) throws Exception{
			RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);
			rentDAO.deleteCartList(c_id);	
			
			response.setContentType("text/html; charset=UTF-8");
			 
			PrintWriter out = response.getWriter();
			 
			out.println("<script language='javascript'>");
			out.println("alert('????????? ?????????????????? ?????????????????????!')");
			out.println("window.location='/customer/rent/cartList'");
			out.println("</script>");
			out.flush();
		}
		
		//????????? ?????? test
		@RequestMapping(value ="/member/rent/wishToRent")
		public String customerWishtoRent(@ModelAttribute("BuyInfoVO") BuyInfoVO buyInfoVO,Model model){

			String productId=buyInfoVO.getProductId();
			ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
			ProductVO productVO=productDAO.productInfo(productId);
			buyInfoVO.setProductPrice(productVO.getP_price());
			buyInfoVO.setProductImg(productVO.getP_mainImg());
			buyInfoVO.setProductName(productVO.getP_name());
			System.out.println(buyInfoVO.toString()+"zz");
			model.addAttribute("buyInfo", buyInfoVO);
			
			return "member/rent/test";
		}
		

		//???????????? insert
				@RequestMapping(value ="/member/rent/wishToCart")
				public String customerWishtoCart(@ModelAttribute("BuyInfoVO") BuyInfoVO buyInfoVO,Model model,HttpSession session){
					RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);
					UserInfoVO userInfo=(UserInfoVO)session.getAttribute("userInfo");
					String userId=userInfo.getM_id();
					String productId=buyInfoVO.getProductId();
					String state=buyInfoVO.getBuyType();
					int amount=buyInfoVO.getProamount();
					Date sdate=buyInfoVO.getRentdate();
				
					CartVO cartVO = new CartVO();
					cartVO.setC_mid(userId);
					cartVO.setC_pid(productId);
					cartVO.setC_state(state);
					cartVO.setC_amount(amount);
					cartVO.setC_date(sdate);
					
					rentDAO.insertCartList(cartVO);
					
					return "redirect:/customer/rent/cartList";
				}

				// ??????
				@RequestMapping(value = "/customer/rent/buy")
				public String adminProductDetail(Model model, HttpSession session) {

					String userId = "crystal";

					RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);
					UserDAO userDAO = sqlSessionTemplate.getMapper(UserDAO.class);

					UserVO userVO = userDAO.memInfo(userId);
					List<CartVO> cartList = rentDAO.getCartList(userId);

					model.addAttribute("userVO", userVO);
					model.addAttribute("cartList", cartList);
					return "member/rent/buy";
				}

}
