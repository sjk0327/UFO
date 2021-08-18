package com.use.first.rent;

import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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

	// 반납 요청 처리
	@RequestMapping(value = "/admin/rent/returnConfirm")
	public String adminRentReturnConfirm(@RequestParam int r_id, Model model, HttpSession session) {
		RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);
		rentDAO.rentReturn(r_id);
		List<RentVO> returnList = rentDAO.returnList();
		model.addAttribute("r_id", r_id);
		session.setAttribute("returnList", returnList);
		return "redirect:/admin/rent/rentDetail/" + r_id;
	}

	// 세션값 재설정
	@RequestMapping(value = "/admin/rent/Findreturnlate")
	public String adminFindreturnlate(HttpSession session) {
		RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);
		List<RentVO> returnList = rentDAO.returnList();
		List<RentVO> lateList = rentDAO.lateList();
		session.setAttribute("lateList", lateList);
		return "redirect:/adminIndex";

	}

	// 연체 시 메세지 처리
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
		out.println("alert('메세지 전송이 완료되었습니다!')");
		out.println("window.location='/admin/rent/rentDetail/" + r_id + "'");
		out.println("</script>");
		out.flush();

	}

	// 위시리스트
	@RequestMapping(value = "/member/rent/wishList")
	public String customerwishList(HttpSession session, Model model) {

		System.out.println(session.getAttribute("userInfo")+"aaa");
		UserInfoVO userInfo=(UserInfoVO)session.getAttribute("userInfo");
		String userId=userInfo.getM_id();
		
		RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);
		List<WishListVO> wishList = rentDAO.getWishList(userId);
		model.addAttribute("wishList", wishList);
		return "/member/rent/memberWishList";
	}

	// 위시리스트 삭제
	@RequestMapping(value = "/member/rent/deleteWishList", method = RequestMethod.POST)
	public void customerDeleteWishList(@RequestParam("w_id") String w_id, Model model, HttpServletResponse response)
			throws Exception {
		RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);
		rentDAO.deleteWishList(w_id);

		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();

		out.println("<script language='javascript'>");
		out.println("alert('상품이 위시리스트에서 삭제되었습니다!')");
		out.println("window.location='/member/rent/wishList'");
		out.println("</script>");
		out.flush();
	}

	@RequestMapping(value = "/member/rent/deleteWishList2", method = RequestMethod.GET)
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
		out.println("alert('선택한 상품들이 위시리스트에서 삭제되었습니다!')");
		out.println("window.location='/member/rent/wishList'");
		out.println("</script>");
		out.flush();

	}

	// 위시리스트 전체 삭제
	@RequestMapping(value = "/member/rent/deleteWishAll")
	public void customerDeleteWishAll(@RequestParam("userID") String w_mid, HttpServletResponse response)
			throws Exception {
		System.out.println(w_mid);
		RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);

		rentDAO.deleteWishAll(w_mid);

		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();

		out.println("<script language='javascript'>");
		out.println("alert('위시리스트를 모두 비웠습니다!')");
		out.println("window.location='/member/rent/wishList'");
		out.println("</script>");
		out.flush();

	}

	
	//장바구니
		@RequestMapping(value = "/member/rent/cartList")
		public String customercartList(HttpSession session, Model model) {
			UserInfoVO userInfo=(UserInfoVO)session.getAttribute("userInfo");
			String userId=userInfo.getM_id();
			RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);
			List<CartVO> cartList = rentDAO.getCartList(userId);	
			cartList.toString();
			model.addAttribute("cartList", cartList);
			return "/member/rent/memberCart";
		}
		
		
		//장바구니 상품 삭제
		@RequestMapping(value = "/member/rent/deleteCartList", method = RequestMethod.POST)
		public void customerDeleteCartList(@RequestParam("cartId") String c_id, Model model,HttpServletResponse response) throws Exception{
			RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);
			rentDAO.deleteCartList(c_id);	
			
			response.setContentType("text/html; charset=UTF-8");
			 
			PrintWriter out = response.getWriter();
			 
			out.println("<script language='javascript'>");
			out.println("alert('상품이 장바구니에서 삭제되었습니다!')");
			out.println("window.location='/member/rent/cartList'");
			out.println("</script>");
			out.flush();
		}
		
		@RequestMapping(value = "/member/rent/deleteCartList2", method = RequestMethod.GET)
		public void customerDeleteSelectCartList(@RequestParam HashMap<String, Object> commandMap, HttpServletResponse response)
				throws Exception {
			RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);

			String[] code_array = null;

			String code = commandMap.get("arrayParam").toString();
			// System.out.println("code:" + code);

			code_array = code.split(",");

			for (int i = 0; i < code_array.length; i++) {
				System.out.println("code_array[]::::" + code_array[i]);
				rentDAO.deleteCartList(code_array[i]);
			}

			response.setContentType("text/html; charset=UTF-8");

			PrintWriter out = response.getWriter();

			out.println("<script language='javascript'>");
			out.println("alert('선택한 상품들이 장바구니에서 삭제되었습니다!')");
			out.println("window.location='/member/rent/cartList'");
			out.println("</script>");
			out.flush();

		}
		
		// 장바구니 전체 삭제
		@RequestMapping(value = "/member/rent/deleteCartAll")
		public void customerDeleteCartAll(@RequestParam("userID") String c_mid, HttpServletResponse response)
				throws Exception {
			
			RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);

			rentDAO.deleteCartAll(c_mid);

			response.setContentType("text/html; charset=UTF-8");

			PrintWriter out = response.getWriter();

			out.println("<script language='javascript'>");
			out.println("alert('장바구니를 모두 비웠습니다!')");
			out.println("window.location='/member/rent/cartList'");
			out.println("</script>");
			out.flush();

		}
		//장바구니 insert
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
					
					return "redirect:/member/rent/cartList";
				}
				
				//장바구니 update
				@RequestMapping(value ="/member/rent/cartUpdate")
				public String customerCartUpdate(@ModelAttribute("BuyInfoVO") BuyInfoVO buyInfoVO,Model model){
					RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);
					System.out.println(buyInfoVO.toString());
					rentDAO.updateCart(buyInfoVO);
					
					
					return "redirect:/member/rent/cartList";
				}
				//데이터 전송 test
				@RequestMapping(value ="/member/rent/wishToRent")
				public String customerWishtoRent(@ModelAttribute("BuyInfoVO") BuyInfoVO buyInfoVO,Model model){

					String productId=buyInfoVO.getProductId();
					ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
					ProductVO productVO=productDAO.productInfo(productId);
					buyInfoVO.setProductPrice(productVO.getP_price());
					buyInfoVO.setProductImg(productVO.getP_mainImg());
					buyInfoVO.setProductName(productVO.getP_name());
					System.out.println(buyInfoVO.toString()+"zz");
					
					ArrayList<BuyInfoVO> buyInfoList = new ArrayList<BuyInfoVO>();
					buyInfoList.add(buyInfoVO);
					model.addAttribute("buyInfoList", buyInfoList);
					
					return "member/rent/test";
				}
				
				//결제폼
				@RequestMapping(value = "/member/rent/buy")
				public String customerBuyForm(@ModelAttribute("BuyInfoVO") BuyInfoVO buyInfoVO,Model model, HttpSession session) {
					
					//세션에서 해당 회원의 아이디 받음
					UserInfoVO userInfo=(UserInfoVO)session.getAttribute("userInfo");
					String userId=userInfo.getM_id();
					
					
					RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);
					UserDAO userDAO = sqlSessionTemplate.getMapper(UserDAO.class);
					ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
					
					//파라미터로 받은 BuyInfo Bean에서 제품 아이디 getter로 받아옴
					String productId=buyInfoVO.getProductId();
					// 제품 아이디로 해당 제품 정보 끌어옴
					ProductVO productVO=productDAO.productInfo(productId);
					//나머지 필요한 제품 정보들 BuyInfoBean에 setter로 넣어줌 
					buyInfoVO.setProductPrice(productVO.getP_price());
					buyInfoVO.setProductImg(productVO.getP_mainImg());
					buyInfoVO.setProductName(productVO.getP_name());
					//회원 정보 받아옴
					UserVO userVO = userDAO.memInfo(userId);

					ArrayList<BuyInfoVO> buyInfoList = new ArrayList<BuyInfoVO>();
					buyInfoList.add(buyInfoVO);
					//모델에 저장
					model.addAttribute("buyInfoList", buyInfoList);
					model.addAttribute("userVO", userVO);
					
					return "member/rent/buy";
				}
				
				//다중 결제폼
				@RequestMapping(value = "/member/rent/buySelect")
				public String customerBuyForm2(@RequestParam HashMap<String, Object> commandMap,Model model, HttpSession session) throws Exception {
					
					//세션에서 해당 회원의 아이디 받음
					UserInfoVO userInfo=(UserInfoVO)session.getAttribute("userInfo");
					String userId=userInfo.getM_id();
					
					
					RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);
					UserDAO userDAO = sqlSessionTemplate.getMapper(UserDAO.class);
					ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
					
					
					ArrayList<BuyInfoVO> buyInfoList = new ArrayList<BuyInfoVO>();
					
					String[] productId_array = null;
					String[] buyType_array = null;
					String[] proamount_array = null;
					String[] rentdate_array = null;

					String code = commandMap.get("productIdArray").toString();
					productId_array = code.split(",");
					code=commandMap.get("buyTypeArray").toString();
					buyType_array = code.split(",");
					code=commandMap.get("proamountArray").toString();
					proamount_array = code.split(",");
					code=commandMap.get("rentdateArray").toString();
					rentdate_array = code.split(",");
					
					
					
					for (int i = 0; i < productId_array.length; i++) {
						BuyInfoVO buyInfoVO=new BuyInfoVO();
						String productId=productId_array[i];
						System.out.println(productId);
						ProductVO productVO=productDAO.productInfo(productId);
						System.out.println(productVO.toString());
						buyInfoVO.setProductId(productId_array[i]);
						buyInfoVO.setProductPrice(productVO.getP_price());
						buyInfoVO.setProductImg(productVO.getP_mainImg());
						buyInfoVO.setProductName(productVO.getP_name());
						buyInfoVO.setBuyType(buyType_array[i]);
						buyInfoVO.setProamount(Integer.parseInt(proamount_array[i]));
						System.out.println(buyInfoVO.toString());
						buyInfoList.add(buyInfoVO);
						System.out.println(buyInfoList);
						System.out.println("sj");
					}

					
					System.out.println("되니");
				
				
					//회원 정보 받아옴
					UserVO userVO = userDAO.memInfo(userId);

					//모델에 저장
					model.addAttribute("buyInfoList", buyInfoList);
					model.addAttribute("userVO", userVO);
					
					return "member/rent/buy";
				}
				
				

}
