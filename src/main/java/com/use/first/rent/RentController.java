package com.use.first.rent;

import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.use.first.buy.BuyDAO;
import com.use.first.buy.BuyVO;
import com.use.first.member.UserDAO;
import com.use.first.member.UserInfoVO;
import com.use.first.member.UserVO;
import com.use.first.message.MessageDAO;
import com.use.first.message.MessageVO;
import com.use.first.paging.Criteria;
import com.use.first.paging.PageMaker;
import com.use.first.product.ProductDAO;
import com.use.first.product.ProductVO;

@Controller
public class RentController {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private Date time = null;

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
		for(int i = 0; i < list.size(); i++) {
			System.out.println("adminRentListSearch :: list : "+ list.get(i).toString());
		}
		System.out.println("adminRentListSearch :: pageMaker : " + pageMaker.toString());
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

		
		System.out.println(rentVO.toString());
		
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
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		rentDAO.rentReturn(r_id);
		RentVO rentVO=rentDAO.rentInfo(r_id);
		
		ProductVO productVO = productDAO.productInfo(rentVO.getR_pid());
		  int b_amount1 = (productVO.getP_canRent() + rentVO.getR_rent());
		  int b_amount2 = (productVO.getP_canBuy() - 0);
		  
		  productDAO.productUpdatebuy(b_amount1, b_amount2, rentVO.getR_pid());
		  
		List<RentVO> returnList = rentDAO.returnList();
		model.addAttribute("r_id", r_id);
		session.setAttribute("returnList", returnList);
		return "redirect:/admin/rent/rentDetail/" + r_id;
	}


	// ?????? ??? ????????? ??????
	@RequestMapping(value = "/admin/rent/sendLateMessage")
	public void adminSendLateMessage(@RequestParam int r_id, Model model, HttpServletResponse response)
			throws Exception {
		RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);
		MessageDAO messageDAO = sqlSessionTemplate.getMapper(MessageDAO.class);
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		System.out.println(r_id);
		RentVO rentVO = rentDAO.rentInfo(r_id);
		ProductVO productVO=productDAO.productInfo(rentVO.getR_pid());
		String r_mid = rentVO.getR_mid();
		MessageVO messageVO = new MessageVO();
		messageVO.setA_rid(r_id);
		messageVO.setA_mid(r_mid);
		messageVO.setA_title("?????? ?????? ?????? ??? ?????? ?????? ?????? ??????");
		messageVO.setA_content(r_mid+"?????????!\n\r?????? ?????? ?????? ?????? "+productVO.getP_name()+"???(???) ?????? ????????????.\n\r???????????? ?????? ????????? ?????? ?????? ?????? ????????? ??????????????????.\n\r\n\r?????? ?????? ??? ?????? ?????? ????????? ????????? ??? ????????? ??????????????????.\n\r?????? ????????? ?????? ????????? ???????????? ?????? ???????????????.\n\r??????????????? ???????????? ???????????? ??????????????????.\n\r???????????????.");
		messageDAO.sendMessage(messageVO);
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();

		out.println("<script language='javascript'>");
		out.println("alert('????????? ????????? ?????????????????????!')");
		out.println("window.location='/admin/rent/rentDetail/" + r_id + "'");
		out.println("</script>");
		out.flush();

	}

	// ???????????????
		@RequestMapping(value = "/member/rent/wishList")
		public String customerwishList(HttpSession session, Model model,Criteria cri) {


		
			System.out.println(session.getAttribute("userInfo")+"aaa");
			UserInfoVO userInfo=(UserInfoVO)session.getAttribute("userInfo");
			String userId=userInfo.getM_id();
			
			
			RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);
			ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
			int smart=0;
			int notebook=0;
			int camera=0;
			int watch=0;
			int tablet=0;
			int max=smart;
			String maxcate="????????????";
			
			//??????????????? ?????? ??? ????????????
			List<WishListVO> list=rentDAO.getWishListAll(userId);
			for(int k=0; k<list.size();k++) {
				String categoty=list.get(k).getP_category();
				if(categoty.equals("?????????")) {
					camera++;
				}
				else if(categoty.equals("?????????")) {
					notebook++;
				}
				else if(categoty.equals("????????????")) {
					smart++;
				}
				else if(categoty.equals("???????????????")) {
					watch++;
				}
				else if(categoty.equals("?????????")) {
					tablet++;
				}
				
			}
			
			
			//???????????????
			if(smart>=notebook) {
				max=smart;
				maxcate="????????????";
			}
			else {
				max=notebook;
				maxcate="?????????";
			}
			if(max>=watch) {
				max=max;
				maxcate=maxcate;
			}
			else {
				max=watch;
				maxcate="???????????????";
			}
			if(max>=camera) {
				max=max;
				maxcate=maxcate;
			}
			else {
				max=camera;
				maxcate="?????????";
			}
			if(max>=tablet) {
				max=max;
				maxcate=maxcate;
			}
			else {
				max=tablet;
				maxcate="?????????";
			}
			
			List<ProductVO> wishProList = productDAO.productBestList(maxcate);
			System.out.println(wishProList.toString());
			
			List<RentVO> rentalListNow=rentDAO.rentListNow(); 	
			List<CartVO> cartList = rentDAO.getCartList(userId);
			
			
		
			// ?????? ???????????? ???????????? ???????????? ????????? ???
					List<WishListVO> wishList = rentDAO.getWishList(userId,cri);
					// PageMaker ?????? ??????
					PageMaker pageMaker = new PageMaker(cri);
					// ?????? ????????? ?????? ??????
					int totalCount = rentDAO.getWishTotalCount(userId,cri);
					// pageMaker??? ??????
					System.out.println(totalCount);
					pageMaker.setTotalCount(totalCount);
					// ????????? ??????
					System.out.println(pageMaker.toString());
					model.addAttribute("pageMaker", pageMaker);
					model.addAttribute("wishList", wishList);
					model.addAttribute("wishProList", wishProList);
					model.addAttribute("rentalListNow", rentalListNow);
					model.addAttribute("cartList", cartList);
					model.addAttribute("maxcate", maxcate);
					
			return "/member/rent/memberWishList";
		}


	// ??????????????? ??????
	@RequestMapping(value = "/member/rent/deleteWishList", method = RequestMethod.POST)
	public String customerDeleteWishList(@RequestParam("w_id") String w_id, Model model)
			throws Exception {
		RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);
		rentDAO.deleteWishList(w_id);

		return "redirect:/member/rent/wishList";
	}

	@RequestMapping(value = "/member/rent/deleteWishList2", method = RequestMethod.GET)
	public String customerWishSelectDelete(@RequestParam HashMap<String, Object> commandMap)
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

		return "redirect:/member/rent/wishList";
	}

	// ??????????????? ?????? ??????
	@RequestMapping(value = "/member/rent/deleteWishAll")
	public String customerDeleteWishAll(@RequestParam("userID") String w_mid)
			throws Exception {
		System.out.println(w_mid);
		RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);

		rentDAO.deleteWishAll(w_mid);

		return "redirect:/member/rent/wishList";
	}

	
	//????????????
		@RequestMapping(value = "/member/rent/cartList")
		public String customercartList(HttpSession session, Model model) {
			UserInfoVO userInfo=(UserInfoVO)session.getAttribute("userInfo");
			String userId=userInfo.getM_id();
			RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);
			List<CartVO> cartList = rentDAO.getCartList(userId);
			List<RentVO> rentalListNow=rentDAO.rentListNow(); 
			System.out.println(rentalListNow.toString());
			model.addAttribute("rentalListNow", rentalListNow);
			model.addAttribute("cartList", cartList);
			return "/member/rent/memberCart";
		}
		
		
		//???????????? ?????? ??????
		@RequestMapping(value = "/member/rent/deleteCartList", method = RequestMethod.POST)
		public String customerDeleteCartList(@RequestParam("cartId") String c_id, Model model, HttpSession session) throws Exception{
			RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);
			rentDAO.deleteCartList(c_id);	
		
				UserInfoVO user=(UserInfoVO)session.getAttribute("userInfo");
					String userId=user.getM_id();
					int count = rentDAO.countCart(userId);
					session.setAttribute("count",count);
			
			return "redirect:/member/rent/cartList";
		}
		
		@RequestMapping(value = "/member/rent/deleteCartList2", method = RequestMethod.GET)
		public String customerDeleteSelectCartList(@RequestParam HashMap<String, Object> commandMap,HttpSession session)
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

			UserInfoVO user=(UserInfoVO)session.getAttribute("userInfo");
			String userId=user.getM_id();
			int count = rentDAO.countCart(userId);
			session.setAttribute("count",count);
			return "redirect:/member/rent/cartList";

		}
		
		// ???????????? ?????? ??????
		@RequestMapping(value = "/member/rent/deleteCartAll")
		public String customerDeleteCartAll(@RequestParam("userID") String c_mid,HttpSession session)
				throws Exception {
			
			RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);

			rentDAO.deleteCartAll(c_mid);
			UserInfoVO user=(UserInfoVO)session.getAttribute("userInfo");
			String userId=user.getM_id();
			int count = rentDAO.countCart(userId);
			session.setAttribute("count",count);
			
			return "redirect:/member/rent/cartList";

		}
		//???????????? insert
				@RequestMapping(value ="/member/rent/wishToCart")
				public String customerWishtoCart(@ModelAttribute("BuyInfoVO") BuyInfoVO buyInfoVO,Model model,HttpSession session,HttpServletResponse response)throws Exception{
					RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);
					UserInfoVO userInfo=(UserInfoVO)session.getAttribute("userInfo");
					String userId=userInfo.getM_id();
					String productId=buyInfoVO.getProductId();
					String state=buyInfoVO.getBuyType();
					int amount=buyInfoVO.getProamount();
					String sdate=buyInfoVO.getRentdate();
					
					CartVO cartVO = new CartVO();
					cartVO.setC_mid(userId);
					cartVO.setC_pid(productId);
					cartVO.setC_state(state);
					cartVO.setC_amount(amount);
					cartVO.setC_date(sdate);
					
					rentDAO.insertCartList(cartVO);
					int count = rentDAO.countCart(userId);
					session.setAttribute("count",count);
					
					return "redirect:/member/rent/cartList";
					
				}
				
				//???????????? insert2
				@RequestMapping(value ="/member/rent/wishToCart2")
				public String customerWishtoCart2(@ModelAttribute("BuyInfoVO") BuyInfoVO buyInfoVO,Model model,HttpSession session,HttpServletResponse response)throws Exception{
					RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);
					UserInfoVO userInfo=(UserInfoVO)session.getAttribute("userInfo");
					String userId=userInfo.getM_id();
					String productId=buyInfoVO.getProductId();
					String state=buyInfoVO.getBuyType();
					int amount=buyInfoVO.getProamount();
					String sdate=buyInfoVO.getRentdate();
					
					CartVO cartVO = new CartVO();
					cartVO.setC_mid(userId);
					cartVO.setC_pid(productId);
					cartVO.setC_state(state);
					cartVO.setC_amount(amount);
					cartVO.setC_date(sdate);
					
					rentDAO.insertCartList(cartVO);
					int count = rentDAO.countCart(userId);
					session.setAttribute("count",count);
					
					return "redirect:/member/rent/wishList";
					
				}
				
				//???????????? update
				@RequestMapping(value ="/member/rent/cartUpdate")
				public String customerCartUpdate(@ModelAttribute("BuyInfoVO") BuyInfoVO buyInfoVO,Model model){
					RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);
					System.out.println(buyInfoVO.toString());
					if(buyInfoVO.getRentdate()==null) {
						
				      Date today = new java.sql.Date(0);
				      SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

				      String now = transFormat.format(today);

						buyInfoVO.setRentdate(now);
					}
					rentDAO.updateCart(buyInfoVO);
					
					
					return "redirect:/member/rent/cartList";
				}
				
				
				//?????????
				@RequestMapping(value = "/member/rent/buy")
				public String customerBuyForm(@ModelAttribute("BuyInfoVO") BuyInfoVO buyInfoVO,Model model, HttpSession session) {
					System.out.println("????????????????");
					//???????????? ?????? ????????? ????????? ??????
					UserInfoVO userInfo=(UserInfoVO)session.getAttribute("userInfo");
					String userId=userInfo.getM_id();
					System.out.println(userId);
					System.out.println(buyInfoVO.toString());
					RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);
					UserDAO userDAO = sqlSessionTemplate.getMapper(UserDAO.class);
					ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
					
					//??????????????? ?????? BuyInfo Bean?????? ?????? ????????? getter??? ?????????
					String productId=buyInfoVO.getProductId();
				System.out.println(productId+"???????????????");
					// ?????? ???????????? ?????? ?????? ?????? ?????????
					ProductVO productVO = productDAO.productInfo(productId);
					//????????? ????????? ?????? ????????? BuyInfoBean??? setter??? ????????? 
					buyInfoVO.setProductPrice(productVO.getP_price());
					buyInfoVO.setProductImg(productVO.getP_mainImg());
					buyInfoVO.setProductName(productVO.getP_name());
					//?????? ?????? ?????????
					UserVO userVO = userDAO.memInfo(userId);

					ArrayList<BuyInfoVO> buyInfoList = new ArrayList<BuyInfoVO>();
					buyInfoList.add(buyInfoVO);
					
					
					//????????? ??????
					model.addAttribute("buyInfoList", buyInfoList);
					model.addAttribute("userVO", userVO);
					model.addAttribute("r_id", buyInfoVO.getRid());
					
					return "member/rent/buy";
				}
				
				//?????? ?????????

				@RequestMapping(value = "/member/rent/buySelect")
				public String customerBuyForm2(@RequestParam HashMap<String, Object> commandMap,Model model, HttpSession session) throws Exception {
					
					//???????????? ?????? ????????? ????????? ??????
					UserInfoVO userInfo=(UserInfoVO)session.getAttribute("userInfo");
					String userId=userInfo.getM_id();
					
					
					RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);
					UserDAO userDAO = sqlSessionTemplate.getMapper(UserDAO.class);
					ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
					
					
					ArrayList<BuyInfoVO> buyInfoList = new ArrayList<BuyInfoVO>();
					
					String[] productId_array = null;
					String[] buyType_array = null;
					String[] proamount_array = null;
					
					
					
					String code = commandMap.get("productIdArray").toString();
					productId_array = code.split(",");
					
					System.out.println(productId_array.length);
					code=commandMap.get("buyTypeArray").toString();
					buyType_array = code.split(",");
					code=commandMap.get("proamountArray").toString();
					proamount_array = code.split(",");
					code=commandMap.get("rentdateArray").toString();
					String[] rentdate_array = new String[productId_array.length];
					rentdate_array = code.split(",");
				
						
					for (int i = 0; i < rentdate_array.length; i++) {
						BuyInfoVO buyInfoVO=new BuyInfoVO();
						String productId=productId_array[i];
						
						ProductVO productVO=productDAO.productInfo(productId);
						
						buyInfoVO.setProductId(productId_array[i]);
						buyInfoVO.setProductPrice(productVO.getP_price());
						buyInfoVO.setProductImg(productVO.getP_mainImg());
						buyInfoVO.setProductName(productVO.getP_name());
						buyInfoVO.setBuyType(buyType_array[i]);
						buyInfoVO.setProamount(Integer.parseInt(proamount_array[i]));
						buyInfoVO.setRentdate(rentdate_array[i]);
						buyInfoList.add(buyInfoVO);
						System.out.println(buyInfoVO.toString());
					}
					for(int i=rentdate_array.length;i<productId_array.length;i++) {
						BuyInfoVO buyInfoVO=new BuyInfoVO();
						String productId=productId_array[i];
						
						ProductVO productVO=productDAO.productInfo(productId);
						buyInfoVO.setProductId(productId_array[i]);
						buyInfoVO.setProductPrice(productVO.getP_price());
						buyInfoVO.setProductImg(productVO.getP_mainImg());
						buyInfoVO.setProductName(productVO.getP_name());
						buyInfoVO.setBuyType(buyType_array[i]);
						buyInfoVO.setProamount(Integer.parseInt(proamount_array[i]));
						buyInfoVO.setRentdate(null);
						buyInfoList.add(buyInfoVO);
						System.out.println(buyInfoVO.toString());
					}


				
					//?????? ?????? ?????????
					UserVO userVO = userDAO.memInfo(userId);

					//????????? ??????
					model.addAttribute("buyInfoList", buyInfoList);
					model.addAttribute("userVO", userVO);
					
					return "member/rent/buy";
				}
				
				//????????? ?????? test
				@RequestMapping(value ="/member/rent/buyKakao")
				public String customerWishtoRent(@Param("BuyVO") BuyVO buyVO,@Param("m_id") String m_id, @Param("m_point") String m_point, @Param("m_tel") String m_tel, @Param("m_addr") String m_addr, @RequestParam("total") int total,Model model,HttpServletRequest request){

					
					System.out.println(buyVO.toString());
					System.out.println(m_id);
					System.out.println(m_point);
					System.out.println(m_tel);
					System.out.println(m_addr);
					System.out.println(total);
					request.setAttribute("total", total);
					request.setAttribute("m_id", m_id);
					request.setAttribute("m_point", m_point);
					request.setAttribute("m_tel", m_tel);
					request.setAttribute("m_addr", m_addr);
					model.addAttribute("buyVO", buyVO);
				
					
					return "member/rent/paytest";
				}
				
				
				// ?????? ?????? ??????
				@RequestMapping(value = "/admin/rent/refundConfirm")
				public void adminRentRefundConfirm(@RequestParam int r_id, Model model, HttpSession session, HttpServletResponse response) throws Exception{
					RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);
					BuyDAO buyDAO = sqlSessionTemplate.getMapper(BuyDAO.class);
					MessageDAO messageDAO = sqlSessionTemplate.getMapper(MessageDAO.class);
					ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
					
					RentVO rentVO = new RentVO();
					RentVO rentbeforeVO=rentDAO.rentInfo(r_id);
					String r_state=rentbeforeVO.getR_state();
					String r_mid = rentbeforeVO.getR_mid();
					ProductVO productVO=productDAO.productInfo(rentbeforeVO.getR_pid());
					int b_amount1=0;
					int b_amount2=0;
					rentVO.setR_id(r_id);
					if(r_state.equals("?????? ??????(??????)")) {
						rentVO.setR_state("?????? ??????(??????)");
					}
					else if(r_state.equals("?????? ??????(?????? ??????)")) {
						rentVO.setR_state("?????? ??????(?????? ??????)");
					}
					else if(r_state.equals("?????? ??????(?????? ??????)")) {
						rentVO.setR_state("?????? ??????(?????? ??????)");
					}
					
					rentDAO.rentRefund(rentVO);
				
					List<BuyVO> buyList=buyDAO.buyList(r_id);
					int lastIndex=buyList.size()-1;
					BuyVO buyVO=buyList.get(lastIndex);
					
					System.out.println(buyVO.toString());
					buyVO.setB_how("????????? ?????? ??????");
					if(r_state.equals("?????? ??????(??????)")) {
						buyVO.setB_state("?????? ??????");
						b_amount1 = (productVO.getP_canRent() + Integer.parseInt(buyVO.getB_amount()));
			    		b_amount2 = (productVO.getP_canBuy() - 0);
			    		  
					}
					else if(r_state.equals("?????? ??????(?????? ??????)")) {
						buyVO.setB_state("?????? ?????? ??????");
						b_amount1 = (productVO.getP_canRent() - 0);
			    		b_amount2 = (productVO.getP_canBuy() + Integer.parseInt(buyVO.getB_amount()));
					}
					else if(r_state.equals("?????? ??????(?????? ??????)")) {
						buyVO.setB_state("?????? ?????? ??????");
						b_amount1 = (productVO.getP_canRent() - 0);
			    		b_amount2 = (productVO.getP_canBuy() + Integer.parseInt(buyVO.getB_amount()));
					}
					buyVO.setB_message(null);
					buyVO.setB_purchase("-"+buyVO.getB_purchase());
					
					buyDAO.purchaseRefund(buyVO);
					 productDAO.productUpdatebuy(b_amount1, b_amount2, buyVO.getB_pid());
					
					model.addAttribute("r_id", r_id);
					
					MessageVO messageVO = new MessageVO();
					messageVO.setA_rid(r_id);
					messageVO.setA_mid(r_mid);
					messageVO.setA_title("?????? ?????? ??? ?????? ??????");
					messageVO.setA_content(r_mid+"?????????!\n\r??????????????? ???????????? ?????? "+productVO.getP_name()+"??? ?????? ?????? ????????? ??????????????? ?????? ?????? ???????????????!\n\r?????? ??? ?????? ????????? ???????????? ???????????? ??????????????????.\n\r\n\r???????????????.");
					messageDAO.sendMessage(messageVO);
					response.setContentType("text/html; charset=UTF-8");
					
					PrintWriter out = response.getWriter();

					out.println("<script language='javascript'>");
					out.println("alert('?????? ?????? ?????? ?????????????????????!')");
					out.println("window.location='/admin/rent/rentDetail/" + r_id + "'");
					out.println("</script>");
					out.flush();
	
				}
				
				//????????? ??????(??????????????? ??????)
				  @RequestMapping(value = "/index/calRentamount", method = RequestMethod.POST)
				  @ResponseBody
					public HashMap<Object, Object> getRentamountToIndex(@RequestParam String rentdate, @RequestParam String p_id) throws Exception{
					 
						ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);	
						RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);	
						ProductVO proVO=productDAO.productInfo(p_id);
						int dbcanrent=proVO.getP_canRent();
						System.out.println(rentdate);

						java.util.Date utilDate = new java.util.Date();

						SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");

						utilDate = transFormat.parse(rentdate);
						java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());

						System.out.println(utilDate);
						System.out.println(sqlDate);
						List<RentVO> canrentlist =rentDAO.rentListNowBypid(sqlDate, p_id);
						System.out.println(canrentlist);
						int canamount=0;
						for(int i=0;i<canrentlist.size();i++) {
							canamount=canamount+canrentlist.get(i).getR_rent();
						}
						canamount=canamount+dbcanrent;
						System.out.println(canamount);
						HashMap<Object, Object> productCanRent = new HashMap<Object, Object>();
						
						productCanRent.put("canamount", canamount);
			
		
						return productCanRent;
					}  
				  
				  @RequestMapping(value = "/index/calPrice", method = RequestMethod.POST)
				  @ResponseBody
					public HashMap<Object, Object> getRentpriceToIndex(@RequestParam String rentamount, @RequestParam String p_id) throws Exception{
					  System.out.println("?????????????");
						ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);		
						ProductVO proVO=productDAO.productInfo(p_id);
						int proPrice=(int)(proVO.getP_price()*0.05);
						int amount=Integer.parseInt(rentamount);
						int rentPrice=proPrice*amount;
						HashMap<Object, Object> productPrice = new HashMap<Object, Object>();
						
						productPrice.put("rentPrice", rentPrice);

						return productPrice;
					}

}
