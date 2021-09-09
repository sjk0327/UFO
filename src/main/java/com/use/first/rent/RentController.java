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

	// 반납 요청 처리
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
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		System.out.println(r_id);
		RentVO rentVO = rentDAO.rentInfo(r_id);
		ProductVO productVO=productDAO.productInfo(rentVO.getR_pid());
		String r_mid = rentVO.getR_mid();
		MessageVO messageVO = new MessageVO();
		messageVO.setA_rid(r_id);
		messageVO.setA_mid(r_mid);
		messageVO.setA_title("대여 연체 알림 및 추가 결제 주의 안내");
		messageVO.setA_content(r_mid+"고객님!\n\r현재 대여 중인 상품 "+productVO.getP_name()+"이(가) 연체 중입니다.\n\r서둘러서 반납 요청을 통해 상품 반납 처리를 부탁드립니다.\n\r\n\r반납 요청 시 추가 연체 금액이 발생할 수 있으니 확인바랍니다.\n\r연체 금액은 대여 금액과 연체일을 통해 산정됩니다.\n\r문의사항이 있으시면 언제든지 연락바랍니다.\n\r감사합니다.");
		messageDAO.sendMessage(messageVO);
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
			String maxcate="스마트폰";
			
			//카테고리별 상품 수 받아오기
			List<WishListVO> list=rentDAO.getWishListAll(userId);
			for(int k=0; k<list.size();k++) {
				String categoty=list.get(k).getP_category();
				if(categoty.equals("카메라")) {
					camera++;
				}
				else if(categoty.equals("노트북")) {
					notebook++;
				}
				else if(categoty.equals("스마트폰")) {
					smart++;
				}
				else if(categoty.equals("스마트워치")) {
					watch++;
				}
				else if(categoty.equals("태블릿")) {
					tablet++;
				}
				
			}
			
			
			//최대구하기
			if(smart>=notebook) {
				max=smart;
				maxcate="스마트폰";
			}
			else {
				max=notebook;
				maxcate="노트북";
			}
			if(max>=watch) {
				max=max;
				maxcate=maxcate;
			}
			else {
				max=watch;
				maxcate="스마트워치";
			}
			if(max>=camera) {
				max=max;
				maxcate=maxcate;
			}
			else {
				max=camera;
				maxcate="카메라";
			}
			if(max>=tablet) {
				max=max;
				maxcate=maxcate;
			}
			else {
				max=tablet;
				maxcate="태블릿";
			}
			
			List<ProductVO> wishProList = productDAO.productBestList(maxcate);
			System.out.println(wishProList.toString());
			
			List<RentVO> rentalListNow=rentDAO.rentListNow(); 	
			List<CartVO> cartList = rentDAO.getCartList(userId);
			
			
		
			// 현재 페이지에 해당하는 게시물을 조회해 옴
					List<WishListVO> wishList = rentDAO.getWishList(userId,cri);
					// PageMaker 객체 생성
					PageMaker pageMaker = new PageMaker(cri);
					// 전체 게시물 수를 구함
					int totalCount = rentDAO.getWishTotalCount(userId,cri);
					// pageMaker로 전달
					System.out.println(totalCount);
					pageMaker.setTotalCount(totalCount);
					// 모델에 추가
					System.out.println(pageMaker.toString());
					model.addAttribute("pageMaker", pageMaker);
					model.addAttribute("wishList", wishList);
					model.addAttribute("wishProList", wishProList);
					model.addAttribute("rentalListNow", rentalListNow);
					model.addAttribute("cartList", cartList);
					
			return "/member/rent/memberWishList";
		}


	// 위시리스트 삭제
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

	// 위시리스트 전체 삭제
	@RequestMapping(value = "/member/rent/deleteWishAll")
	public String customerDeleteWishAll(@RequestParam("userID") String w_mid)
			throws Exception {
		System.out.println(w_mid);
		RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);

		rentDAO.deleteWishAll(w_mid);

		return "redirect:/member/rent/wishList";
	}

	
	//장바구니
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
		
		
		//장바구니 상품 삭제
		@RequestMapping(value = "/member/rent/deleteCartList", method = RequestMethod.POST)
		public String customerDeleteCartList(@RequestParam("cartId") String c_id, Model model) throws Exception{
			RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);
			rentDAO.deleteCartList(c_id);	
			
			
			return "redirect:/member/rent/cartList";
		}
		
		@RequestMapping(value = "/member/rent/deleteCartList2", method = RequestMethod.GET)
		public String customerDeleteSelectCartList(@RequestParam HashMap<String, Object> commandMap)
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

			
			return "redirect:/member/rent/cartList";

		}
		
		// 장바구니 전체 삭제
		@RequestMapping(value = "/member/rent/deleteCartAll")
		public String customerDeleteCartAll(@RequestParam("userID") String c_mid)
				throws Exception {
			
			RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);

			rentDAO.deleteCartAll(c_mid);

			
			return "redirect:/member/rent/cartList";

		}
		//장바구니 insert
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
					
					return "redirect:/member/rent/cartList";
					
				}
				
				//장바구니 insert2
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
					
					return "redirect:/member/rent/wishList";
					
				}
				
				//장바구니 update
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
					ProductVO productVO = productDAO.productInfo(productId);
					//나머지 필요한 제품 정보들 BuyInfoBean에 setter로 넣어줌 
					buyInfoVO.setProductPrice(productVO.getP_price());
					buyInfoVO.setProductImg(productVO.getP_mainImg());
					buyInfoVO.setProductName(productVO.getP_name());
					//회원 정보 받아옴
					UserVO userVO = userDAO.memInfo(userId);

					ArrayList<BuyInfoVO> buyInfoList = new ArrayList<BuyInfoVO>();
					buyInfoList.add(buyInfoVO);
					
					System.out.println(buyInfoVO.getRid());
					//모델에 저장
					model.addAttribute("buyInfoList", buyInfoList);
					model.addAttribute("userVO", userVO);
					model.addAttribute("r_id", buyInfoVO.getRid());
					
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


				
					//회원 정보 받아옴
					UserVO userVO = userDAO.memInfo(userId);

					//모델에 저장
					model.addAttribute("buyInfoList", buyInfoList);
					model.addAttribute("userVO", userVO);
					
					return "member/rent/buy";
				}
				
				//데이터 전송 test
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
				
				
				// 환불 요청 처리
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
					if(r_state.equals("환불 요청(대여)")) {
						rentVO.setR_state("환불 완료(대여)");
					}
					else if(r_state.equals("환불 요청(구매 확정)")) {
						rentVO.setR_state("환불 완료(구매 확정)");
					}
					else if(r_state.equals("환불 요청(즉시 구매)")) {
						rentVO.setR_state("환불 완료(즉시 구매)");
					}
					
					rentDAO.rentRefund(rentVO);
				
					List<BuyVO> buyList=buyDAO.buyList(r_id);
					int lastIndex=buyList.size()-1;
					BuyVO buyVO=buyList.get(lastIndex);
					
					System.out.println(buyVO.toString());
					buyVO.setB_how("관리자 승인 환불");
					if(r_state.equals("환불 요청(대여)")) {
						buyVO.setB_state("대여 환불");
						b_amount1 = (productVO.getP_canRent() + Integer.parseInt(buyVO.getB_amount()));
			    		b_amount2 = (productVO.getP_canBuy() - 0);
			    		  
					}
					else if(r_state.equals("환불 요청(구매 확정)")) {
						buyVO.setB_state("구매 확정 환불");
						b_amount1 = (productVO.getP_canRent() - 0);
			    		b_amount2 = (productVO.getP_canBuy() + Integer.parseInt(buyVO.getB_amount()));
					}
					else if(r_state.equals("환불 요청(즉시 구매)")) {
						buyVO.setB_state("즉시 구매 환불");
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
					messageVO.setA_title("환불 요청 건 승인 안내");
					messageVO.setA_content(r_mid+"고객님!\n\r고객님께서 요청하신 상품 "+productVO.getP_name()+"에 대한 환불 요청이 정상적으로 승인 처리 되었습니다!\n\r확인 후 문의 사항이 있으시면 언제든지 연락바랍니다.\n\r\n\r감사합니다.");
					messageDAO.sendMessage(messageVO);
					response.setContentType("text/html; charset=UTF-8");
					
					PrintWriter out = response.getWriter();

					out.println("<script language='javascript'>");
					out.println("alert('환불 승인 처리 완료되었습니다!')");
					out.println("window.location='/admin/rent/rentDetail/" + r_id + "'");
					out.println("</script>");
					out.flush();
	
				}
				


}
