package com.use.first.product;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.use.first.member.ReviewVO;
import com.use.first.member.UserInfoVO;
import com.use.first.paging.Criteria;
import com.use.first.paging.PageMaker;
import com.use.first.rent.BuyInfoVO;
import com.use.first.rent.CartVO;
import com.use.first.rent.WishListVO;


@Controller
public class ProductController {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	// 신영-관리자 상품리스트
		@RequestMapping(value = "/admin/pro/productList", method = RequestMethod.GET)
		public String getProductList(Model model, Criteria cri) {
			ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
			// 현재 페이지에 해당하는 게시물을 조회해 옴
			List<ProductVO> list = productDAO.productList(cri);
			model.addAttribute("productList", list);
			PageMaker pageMaker = new PageMaker(cri);
			int totalCount = productDAO.countProductListTotal(cri);
			pageMaker.setTotalCount(totalCount);
			// pageMaker.setTotalCount(productDAO.countProductListTotal());
			model.addAttribute("pageMaker", pageMaker);

			return "admin/pro/adminProductList";
		}

		// 신영-관리자 상품리스트(검색조건들어옴post)
		@RequestMapping(value = "/admin/pro/productList", method = RequestMethod.POST)
		public String getProductSearch(Model model, Criteria cri) {
			ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
			// 현재 페이지에 해당하는 게시물을 조회해 옴
			List<ProductVO> list = productDAO.productList(cri);
			model.addAttribute("productList", list);
			
			PageMaker pageMaker = new PageMaker(cri);
			int totalCount = productDAO.countProductListTotal(cri);
			pageMaker.setTotalCount(totalCount);
			// pageMaker.setTotalCount(productDAO.countProductListTotal());
			model.addAttribute("pageMaker", pageMaker);

			return "admin/pro/adminProductList";
		}

		// 신영-관리자 상품등록
		@RequestMapping(value = "/admin/pro/productInsertForm", method = RequestMethod.GET)
		public String productInsertForm(ProductVO productVO) {
			return "admin/pro/adminProductInsertForm";
		}

		// 신영-관리자 상품등록
		@RequestMapping(value = "/admin/pro/productInsert", method = RequestMethod.POST)
		public String productInsert(ProductVO productVO) throws IOException {
			MultipartFile mainFile = productVO.getMainFile();
			if (!mainFile.isEmpty()) {
				String mainFileName = mainFile.getOriginalFilename();
				mainFile.transferTo(new File(
						"C:\\FinalProject\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\UFO\\resources\\Images\\product\\"
								+ mainFileName));
				productVO.setP_mainImg(mainFileName);
			}
			MultipartFile subFile = productVO.getSubFile();
			if (!subFile.isEmpty()) {
				String subFileName = subFile.getOriginalFilename();
				subFile.transferTo(new File(
						"C:\\FinalProject\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\UFO\\resources\\Images\\product\\"
								+ subFileName));
				productVO.setP_subImg(subFileName);
			}
			ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
			int n = productDAO.productInsert(productVO);

			if (n == 0) {
				System.out.println("등록 실패");
			}
			return "redirect:/admin/pro/productList";
		}

		// 신영-관리자 상품리스트-다중선택삭제
		@RequestMapping(value = "/admin/pro/productDelete2", method = RequestMethod.GET)
		public String adminProductSelectDelete(@RequestParam HashMap<String, Object> commandMap) {
			ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
			String[] code_array = null;
			String code = commandMap.get("arrayParam").toString();
			code_array = code.split(",");
			for (int i = 0; i < code_array.length; i++) {
				System.out.println("code_array[]::::" + code_array[i]);
				productDAO.deleteById(code_array[i]);
			}
			return "redirect:/admin/pro/productList";
		}

		// 신영 관리자상품리스트에서 한줄 수량관련 수정
		@RequestMapping(value = "/admin/pro/productUpdate2/{p_id}/{p_canBuy}/{p_canRent}", method = RequestMethod.GET)
		public String adminProductUpdate2(ProductVO productVO, @PathVariable String p_id,@PathVariable String p_canBuy,@PathVariable String p_canRent) {
			System.out.println("adminProductUpdate2 왔니?");
			System.out.println(p_canBuy + p_canRent);
			ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
			int n = productDAO.productUpdate2(productVO);
			if (n != 1) {
				// 업데이트 실패 시
				System.out.println("adminProductUpdate2 // 상품 수정 실패 // " + productVO.toString());
			}
			return "redirect:/admin/pro/productList/";
		}
		
		
		
		/*  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~신영 회원 시작~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

		// 신영-고객쪽 상품리스트
		@RequestMapping(value = "/member/pro/productList", method = RequestMethod.GET)
		public String getMemberProductList(Model model, Criteria cri) {
			ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
			List<ProductVO> list = productDAO.productList(cri);
				
			
			model.addAttribute("productList", list);
			PageMaker pageMaker = new PageMaker(cri);
			int totalCount = productDAO.countProductListTotal(cri);
			int countSmartPhone = productDAO.countSmartPhone();
			int countLaptop = productDAO.countLaptop();
			int countCamera = productDAO.countCamera();
			int countWatch = productDAO.countWatch();
			int countTablet = productDAO.countTablet();
			pageMaker.setTotalCount(totalCount);

			model.addAttribute("pageMaker", pageMaker);
			model.addAttribute("totalCount", totalCount);
			model.addAttribute("countSmartPhone", countSmartPhone);
			model.addAttribute("countLaptop", countLaptop);
			model.addAttribute("countCamera", countCamera);
			model.addAttribute("countWatch", countWatch);
			model.addAttribute("countTablet", countTablet);

			return "member/pro/memberProductList";
		}
		@RequestMapping(value = "/member/pro/productList", method = RequestMethod.POST)
		public String getMemberPostProductList(Model model, Criteria cri) {
			
			ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
			System.out.println(model.toString());
			System.out.println(cri.getKeyword() + cri.getSearchType());
			//대분류/중분류 값이 다 넘어온다면
			if(cri.getKeyword() != null && cri.getSearchType() == null) {
				List<ProductVO> list = productDAO.productKeywordList(cri);
				PageMaker pageMaker = new PageMaker(cri);
				int totalCount = productDAO.countProductListTotal(cri);
				int countSmartPhone = productDAO.countSmartPhone();
				int countLaptop = productDAO.countLaptop();
				int countCamera = productDAO.countCamera();
				int countWatch = productDAO.countWatch();
				int countTablet = productDAO.countTablet();
				pageMaker.setTotalCount(totalCount);

				model.addAttribute("pageMaker", pageMaker);
				model.addAttribute("totalCount", totalCount);
				model.addAttribute("countSmartPhone", countSmartPhone);
				model.addAttribute("countLaptop", countLaptop);
				model.addAttribute("countCamera", countCamera);
				model.addAttribute("countWatch", countWatch);
				model.addAttribute("countTablet", countTablet);
				model.addAttribute("productList", list);
				return "member/pro/memberProductList";
				}
				
				
			 else if (cri.getKeyword() != null && cri.getSearchType() != null) {
				List<ProductVO> list = productDAO.productKeywordSearchTypeList(cri);
				PageMaker pageMaker = new PageMaker(cri);
				int totalCount = productDAO.countProductListTotal(cri);
				int countSmartPhone = productDAO.countSmartPhone();
				int countLaptop = productDAO.countLaptop();
				int countCamera = productDAO.countCamera();
				int countWatch = productDAO.countWatch();
				int countTablet = productDAO.countTablet();
				pageMaker.setTotalCount(totalCount);

				model.addAttribute("pageMaker", pageMaker);
				model.addAttribute("totalCount", totalCount);
				model.addAttribute("countSmartPhone", countSmartPhone);
				model.addAttribute("countLaptop", countLaptop);
				model.addAttribute("countCamera", countCamera);
				model.addAttribute("countWatch", countWatch);
				model.addAttribute("countTablet", countTablet);
				model.addAttribute("productList", list);
				return "member/pro/memberProductList";
				}
				return "member/pro/memberProductList";
			}
		
		

		// 신영-고객쪽 상품리스트(카테고리별)

		@RequestMapping(value = "/member/pro/productList/{p_category}", method = RequestMethod.GET)
		public String getMemberProductCateList(Model model, Criteria cri, @PathVariable String p_category) {
			System.out.println( "p_category::" + p_category );
			
			ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
			
			//List<ProductVO> list = productDAO.pictogramSearch(p_category);
			List<ProductVO> list = productDAO.productSmartPhoneList(p_category);
				
			model.addAttribute("productList", list);
			PageMaker pageMaker = new PageMaker(cri);
			int totalCount = productDAO.countProductListTotal(cri);
			int countSmartPhone = productDAO.countSmartPhone();
			int countLaptop = productDAO.countLaptop();
			int countCamera = productDAO.countCamera();
			int countWatch = productDAO.countWatch();
			int countTablet = productDAO.countTablet();
			pageMaker.setTotalCount(totalCount);

			model.addAttribute("pageMaker", pageMaker);
			model.addAttribute("totalCount", totalCount);
			model.addAttribute("countSmartPhone", countSmartPhone);
			model.addAttribute("countLaptop", countLaptop);
			model.addAttribute("countCamera", countCamera);
			model.addAttribute("countWatch", countWatch);
			model.addAttribute("countTablet", countTablet);
			return "member/pro/memberProductList";
		}
		
		// 신영-상품정렬

		  @RequestMapping(value = "/member/pro/productList/sort/{sort}", method = RequestMethod.GET)
		  public String sort(Model model,Criteria cri, @PathVariable String sort) { 
			 
		  ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		  
		  if(sort.equals("pricelow")) {
		  List<ProductVO> list = productDAO.productSortLow(cri);
			/*
			 * System.out.println("list.get(i).getP_id()" + list.get(0).getP_id()); for(int
			 * i=0; i<list.size(); i++) { int readCount =
			 * productDAO.productReadUpdate(list.get(i).getP_id());
			 * System.out.println("분류별readCoun:::" + readCount); }
			 */
		  model.addAttribute("productList", list);
		  }
		  else if(sort.equals("pricehigh")){
			  List<ProductVO> rlist = productDAO.productSortHigh(cri);			  
			  model.addAttribute("productList", rlist);
		  }
		  else if(sort.equals("recommand")){
			  List<ProductVO> rclist = productDAO.productRecommand(cri);
			  model.addAttribute("productList", rclist);
		  }
		 
		 
		  return "member/pro/memberProductList2";
		  
		  }	
	  	
		  //신영-메뉴바 가격조회
		  @RequestMapping(value = "/member/pro/productList/priceSearch/{minPrice}/{maxPrice}", method = RequestMethod.GET)
		  public String sort(Model model,Criteria cri, @PathVariable String minPrice,@PathVariable String maxPrice) { 		  
		  ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		  List<ProductVO> pslist = productDAO.productMenubarPriceSearch(minPrice,maxPrice);
		  model.addAttribute("productList", pslist);		  
		  return "member/pro/memberProductList2";
		  }	
		  // 신영-관리자 상품 클릭 시, 조회수 증가
		  @RequestMapping(value = "/member/pro/productList/readUpdate/{p_id}", method = RequestMethod.GET)
		  public String readCount(Model model, @PathVariable String p_id) {
			System.out.println("조회수증가왔니?");
			System.out.println(p_id);
			ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
			int readCount = productDAO.productReadUpdate(p_id);
			System.out.println(readCount);
			if(readCount != 0) {
				System.out.println("업데이트 성공");
			}
			else System.out.println("업데이트 실패");
			
			return "redirect:/member/pro/productList";
		}
			
		/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~병찬 관리자 시작~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
		//상품상세보기
			@RequestMapping(value = "/admin/pro/productDetail/{p_id}", method = RequestMethod.GET)
			public String adminProductDetail(Model model, @PathVariable String p_id) {
				ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
				ProductVO productVO = productDAO.productInfo(p_id);
				model.addAttribute("productVO", productVO);
				return "/admin/pro/adminProductDetail";
			}
			//상품삭제. FK잡혀있는거 삭제 안됨. 수정해야됨
			@RequestMapping(value = "/admin/pro/productDelete/{p_id}", method = RequestMethod.GET)			
			public String adminProductDelete(@PathVariable String p_id) {
				ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
				int n = productDAO.productDelete(p_id);
				return "redirect:/admin/pro/productList";
			}
			
		
			//상품수정	
			@RequestMapping(value = "/admin/pro/productUpdate/{product_id}", method = RequestMethod.POST)
			public String adminProductUpdate(Model model, ProductVO productVO, @PathVariable String product_id) throws IOException{
				
				MultipartFile mainFile = productVO.getMainFile();
				if(!mainFile.isEmpty()) {
					String mainFileName = mainFile.getOriginalFilename();
					mainFile.transferTo(new File("C:\\FinalProject\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\UFO\\resources\\Images\\product\\" + mainFileName));
					productVO.setP_mainImg(mainFileName);
				}
				MultipartFile subFile = productVO.getSubFile();
				if(!subFile.isEmpty()) {
					String subFileName = subFile.getOriginalFilename();
					subFile.transferTo(new File("C:\\FinalProject\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\UFO\\resources\\Images\\product\\" + subFileName));
					productVO.setP_subImg(subFileName);
				}
				ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);		
				int n = productDAO.productUpdate(productVO);
				if (n != 1) {
					// 업데이트 실패 시
					System.out.println("adminProductUpdate // 상품 수정 실패 // " + productVO.toString());
				}	
				return "redirect:/admin/pro/productDetail/"+ product_id;
			}
	
			  /*
				//고객 상품상세보기 
				  @RequestMapping(value = "/member/pro/productDetail/{p_id}", method = RequestMethod.GET)
					public String memberProductDetail(@ModelAttribute BuyInfoVO buyInfoVO, HttpSession session, Model model, @PathVariable String p_id) {
					    if (session.getAttribute("userInfo") != null) {
					    	UserInfoVO userInfo = (UserInfoVO) session.getAttribute("userInfo");
							String userId=userInfo.getM_id();						  
						  	String w_mid = userId;
							String w_pid = p_id;
							String r_mid = userId;
							String r_pid = p_id; 
							ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
							ProductVO productVO = productDAO.productInfo(p_id);
							WishListVO wishListVO = productDAO.checkWishList(w_pid,w_mid);
							RecommendVO recommendVO = productDAO.checkRecommend(r_pid,r_mid);
							int recommendCount = productDAO.recommendCount(r_pid);
							model.addAttribute("productVO", productVO);
							model.addAttribute("wishListVO", wishListVO);
							model.addAttribute("buyInfoVO", buyInfoVO);
							model.addAttribute("recommendVO", recommendVO);
							model.addAttribute("recommendCount", recommendCount);
					    } else {

							String w_pid = p_id;
					
							String r_pid = p_id; 
							ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
							ProductVO productVO = productDAO.productInfo(p_id);

							int recommendCount = productDAO.recommendCount(r_pid);
							model.addAttribute("productVO", productVO);
							model.addAttribute("recommendCount", recommendCount);
							model.addAttribute("buyInfoVO", buyInfoVO);
					    }	
						return "/member/pro/memberProductDetail";					
					}		
					*/
			
			//ajax 위시리스트 추가
			@ResponseBody
			@RequestMapping(value = "/member/wishListInsert/{p_id}", method = RequestMethod.POST)
			public String WishListInsert(WishListVO wishListVO, HttpSession session, @PathVariable String p_id ) {					
			UserInfoVO userInfo = (UserInfoVO) session.getAttribute("userInfo");
			String userId=userInfo.getM_id();				
			String w_mid = userId;
			wishListVO.setW_mid(w_mid);
			wishListVO.setW_pid(p_id);
			ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
			int n = productDAO.wishListInsert(wishListVO);
			 if(n==0) {System.out.println("등록 실패");}
			return "/member/pro/productDetail/"+p_id;
			}
			
			//ajax 위시리스트 삭제
					

			@RequestMapping(value = "/member/wishListDelete/{p_id}", method = RequestMethod.POST)
			public String WishListDelete(WishListVO wishListVO, HttpSession session, @PathVariable String p_id ) {					
			UserInfoVO userInfo = (UserInfoVO) session.getAttribute("userInfo");
			String userId = userInfo.getM_id();				
			String w_mid = userId;
			wishListVO.setW_mid(w_mid);
			wishListVO.setW_pid(p_id);

			ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
			int n = productDAO.wishListDelete(wishListVO);
				if(n==0) {System.out.println("등록 실패");}
			return "/member/pro/productDetail/"+p_id;
			}
			
			
			//ajax 고객에서 장바구니 추가
			@ResponseBody
			@RequestMapping(value = "/member/cartInsert/{p_id}", method = RequestMethod.POST)
			public String WishListInsert(CartVO cartVO, HttpSession session, @PathVariable String p_id, @RequestParam int amount,String c_state, String requestRentDate ) {
				UserInfoVO userInfo = (UserInfoVO) session.getAttribute("userInfo");
				String userId=userInfo.getM_id();				
				String c_mid = userId;
				cartVO.setC_mid(c_mid);
				cartVO.setC_pid(p_id);
				cartVO.setC_amount(amount);
				cartVO.setC_state(c_state);

				ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
				int n = productDAO.cartListInsert(cartVO);
							
					if(n==0) {System.out.println("등록 실패");}
					return null;
			}
			//조아용
			@ResponseBody
			@RequestMapping(value = "/member/recommendInsert/{p_id}", method = RequestMethod.POST)
			public String recommendInsert(RecommendVO recommendVO, HttpSession session, @PathVariable String p_id ) {					
			UserInfoVO userInfo = (UserInfoVO) session.getAttribute("userInfo");
			String userId=userInfo.getM_id();
			String r_mid = userId;
			recommendVO.setR_mid(r_mid);
			recommendVO.setR_pid(p_id);
			ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
			int n = productDAO.recommendInsert(recommendVO);
			 if(n==0) {System.out.println("등록 실패");}
			return "/member/pro/productDetail/"+p_id;
			}

			@RequestMapping(value = "/member/recommendDelete/{p_id}", method = RequestMethod.POST)
			public String likeDelete(RecommendVO recommendVO, HttpSession session, @PathVariable String p_id ) {					
				UserInfoVO userInfo = (UserInfoVO) session.getAttribute("userInfo");
				String userId=userInfo.getM_id();
				String r_mid = userId;
				recommendVO.setR_mid(r_mid);
				recommendVO.setR_pid(p_id);
			ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
			int n = productDAO.recommendDelete(recommendVO);
				if(n==0) {System.out.println("등록 실패");}
			return "/member/pro/productDetail/"+p_id;
			}

			
			/*
		//리뷰 list 
			@RequestMapping(value = "/member/recList/{v_pid}", method = RequestMethod.GET)
			public String getReviewList(@PathVariable String v_pid, Model model, Criteria cri) {		
				ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
				List<ReviewVO> reviewList = productDAO.reviewList(v_pid);		
				PageMaker pageMaker = new PageMaker(cri);
				int totalCount = productDAO.countReviewListTotal(v_pid);
				pageMaker.setTotalCount(totalCount);
				model.addAttribute("reviewList", reviewList);
				model.addAttribute("pageMaker", pageMaker);
				return "/member/pro/review";
			
			}
			
			@RequestMapping(value = "/member/recList", method = RequestMethod.GET)
			public String getReviewPageList(@RequestParam String v_pid,@RequestParam String page,@RequestParam String perPageNum, Model model, Criteria cri) {		
				ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);		
				List<ReviewVO> reviewList = productDAO.reviewList(v_pid);		
				PageMaker pageMaker = new PageMaker(cri);
				int totalCount = productDAO.countReviewListTotal(v_pid);
				pageMaker.setTotalCount(totalCount);
				model.addAttribute("reviewList", reviewList);
				model.addAttribute("pageMaker", pageMaker);
				return "/member/pro/review";
			
			}
			*/
			
			//고객 상품상세보기 
			@RequestMapping(value = "/member/pro/productDetail/{p_id}", method = RequestMethod.GET)
			public String memberProductDetail(@ModelAttribute BuyInfoVO buyInfoVO, HttpSession session, Model model, @PathVariable String p_id, Criteria cri) {
		    if (session.getAttribute("userInfo") != null) {
		    	UserInfoVO userInfo = (UserInfoVO) session.getAttribute("userInfo");
				String userId=userInfo.getM_id();						  
			  	String w_mid = userId;
				String w_pid = p_id;
				String r_mid = userId;
				String r_pid = p_id; 
			
				ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
				ProductVO productVO = productDAO.productInfo(p_id);
				WishListVO wishListVO = productDAO.checkWishList(w_pid,w_mid);
				RecommendVO recommendVO = productDAO.checkRecommend(r_pid,r_mid);
				int recommendCount = productDAO.recommendCount(r_pid);
				//리뷰용 추가	
				System.out.println("2");
				String v_pid =  p_id;
				List<ReviewVO> reviewList = productDAO.reviewList(v_pid);		
				PageMaker pageMaker = new PageMaker(cri);
				int totalCount = productDAO.countReviewListTotal(v_pid);
				pageMaker.setTotalCount(totalCount);
				
				model.addAttribute("productVO", productVO);
				model.addAttribute("wishListVO", wishListVO);
				model.addAttribute("buyInfoVO", buyInfoVO);
				model.addAttribute("recommendVO", recommendVO);
				model.addAttribute("recommendCount", recommendCount);
				//추가
				model.addAttribute("reviewList", reviewList);
				model.addAttribute("pageMaker", pageMaker);
				
		    } else {

				String w_pid = p_id;
		
				String r_pid = p_id; 
				ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
				ProductVO productVO = productDAO.productInfo(p_id);

				int recommendCount = productDAO.recommendCount(r_pid);
				model.addAttribute("productVO", productVO);
				model.addAttribute("recommendCount", recommendCount);
				model.addAttribute("buyInfoVO", buyInfoVO);
		    }
		    return "/member/pro/memberProductDetail";					
		}		
									
	}
