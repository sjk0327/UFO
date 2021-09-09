package com.use.first.product;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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

import com.use.first.member.UserDAO;
import com.use.first.member.UserInfoVO;
import com.use.first.member.UserVO;
import com.use.first.paging.Criteria;
import com.use.first.paging.PageMaker;
import com.use.first.rec.RecVO;
import com.use.first.rent.BuyInfoVO;
import com.use.first.rent.CartVO;
import com.use.first.rent.RentDAO;
import com.use.first.rent.RentVO;
import com.use.first.rent.WishListVO;

@Controller
public class ProductController {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	// 신영-관리자 상품리스트
	@RequestMapping(value = "/admin/pro/productList", method = RequestMethod.GET)
	public String getProductList(Model model, Criteria cri) {
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		List<ProductVO> list = productDAO.productList(cri);
		model.addAttribute("productList", list);
		PageMaker pageMaker = new PageMaker(cri);
		int totalCount = productDAO.countProductListTotal(cri);
		pageMaker.setTotalCount(totalCount);			
		model.addAttribute("pageMaker", pageMaker);

		return "admin/pro/adminProductList";
	}

	// 신영-관리자 상품리스트(검색조건들어옴post)
	@RequestMapping(value = "/admin/pro/productList", method = RequestMethod.POST)
	public String getProductSearch(Model model, Criteria cri) {
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);			
		List<ProductVO> list = productDAO.productList(cri);
		model.addAttribute("productList", list);			
		PageMaker pageMaker = new PageMaker(cri);
		int totalCount = productDAO.countProductListTotal(cri);
		pageMaker.setTotalCount(totalCount);
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
	@RequestMapping(value = "/admin/pro/productUpdateRow/{p_id}/{p_canBuy}/{p_canRent}", method = RequestMethod.GET)
	public String adminProductUpdate2(ProductVO productVO, @PathVariable String p_id, @PathVariable String p_canBuy, 
																					  		@PathVariable String p_canRent) {
		System.out.println("adminProductUpdate2 왔니?");
		System.out.println(p_canBuy + p_canRent);
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		int n = productDAO.productUpdate2(productVO);
		if (n != 1) {
			// 업데이트 실패 시
			System.out.println("상품 수정 실패");
		}
		return "redirect:/admin/pro/productList/";
	}
	
	
	
	
	/*  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~신영 회원 시작~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */

	// 신영-고객쪽 상품리스트
	@RequestMapping(value = "/member/pro/productList", method = RequestMethod.GET)
	public String getMemberProductList( Model model, Criteria cri) {
	//@RequestMapping(value = "/member/pro/productList/{p_id}", method = RequestMethod.GET)
	//public String getMemberProductList(HttpServletRequest request, HttpServletResponse response, 
	//												@Param("p_id") String p_id, Model model, Criteria cri) {
		
				
		System.out.println("getMemberProductList :: where : 지금 불리는 곳인가요?");
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		
		System.out.println("getMemberProductList :: 시작 cri : " + cri.toString());
		//대분류/중분류 값이 다 넘어온다면
		List<ProductVO> list = null;
		int pageCount = 0;
		if(cri.getSearchType() == null) {
			cri.setSearchType("");
		}
		
		if(cri.getSort() != null) {
			System.out.println("getMemberProductList :: sort 있음 : " + cri.getSort());
			if(cri.getSort().equals("pricelow")) {
				list = productDAO.productSortLow(cri);
				pageCount = productDAO.countProductListTotalPage(cri);
				System.out.println("recommand size::: pageCount :" + list.size() + "/" + pageCount);
			}
			else if(cri.getSort().equals("pricehigh")){
				list = productDAO.productSortHigh(cri);
				pageCount = productDAO.countProductListTotalPage(cri);
				System.out.println("recommand size::: pageCount :" + list.size() + "/" + pageCount);
			}
			else if(cri.getSort().equals("recommand")){
				list = productDAO.productRecommand(cri);
				pageCount = productDAO.countProductListTotalPageRecommand(cri);
				System.out.println("recommand size::: pageCount :" + list.size() + "/" + pageCount);
			}	 
		}else {
			list = productDAO.productList(cri);
			pageCount = productDAO.countProductListTotalPage(cri);
		}
		
		/* 쿠키 도전중  start 
		Cookie recentCookie = new Cookie(p_id, null);
		recentCookie.setPath("/");
		recentCookie.setMaxAge(0);
		response.addCookie(recentCookie);
		recentCookie = new Cookie(p_id, p_id);
		recentCookie.setPath("/");
		recentCookie.setMaxAge(60*60*24*3);
		response.addCookie(recentCookie);
		
		Cookie[] recentArray = request.getCookies();
		int recentCount = productDAO.recentCookie(recentArray, (page-1)*limit, listCount));
		
		List<ProductVO> list = productDAO.productList(cri);			
		쿠키 도전중  end */		
		
		
		model.addAttribute("productList", list);
		PageMaker pageMaker = new PageMaker(cri);
		int totalCount = productDAO.countProductListTotal(cri);
		int countSmartPhone = productDAO.countSmartPhone();
		int countLaptop = productDAO.countLaptop();
		int countCamera = productDAO.countCamera();
		int countWatch = productDAO.countWatch();
		int countTablet = productDAO.countTablet();
		

		
		pageMaker.setTotalCount(pageCount);
		System.out.println("getMemberPostProductList :: pageMaker : " + pageMaker.toString());
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
	public String getMemberPostProductList(Model model, Criteria cri, HttpServletRequest request) {
		System.out.println("getMemberPostProductList :: where : 지금 불리는 곳인가요?");
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		
		System.out.println("getMemberProductList :: 시작 cri : " + cri.toString());
		//대분류/중분류 값이 다 넘어온다면
		List<ProductVO> list = null;
		int pageCount = 0;
		if(cri.getSearchType() == null) {
			cri.setSearchType("");
		}
		
		if(cri.getSort() != null) {
			System.out.println("getMemberProductList :: sort 있음 : " + cri.getSort());
			if(cri.getSort().equals("pricelow")) {
				list = productDAO.productSortLow(cri);
				pageCount = productDAO.countProductListTotalPage(cri);
				System.out.println("recommand size::: pageCount :" + list.size() + "/" + pageCount);
			}
			else if(cri.getSort().equals("pricehigh")){
				list = productDAO.productSortHigh(cri);
				pageCount = productDAO.countProductListTotalPage(cri);
				System.out.println("recommand size::: pageCount :" + list.size() + "/" + pageCount);
			}
			else if(cri.getSort().equals("recommand")){
				list = productDAO.productRecommand(cri);
				pageCount = productDAO.countProductListTotalPageRecommand(cri);
				System.out.println("recommand size::: pageCount :" + list.size() + "/" + pageCount);
			}	 
		}else {

			list = productDAO.productList(cri);
			pageCount = productDAO.countProductListTotalPage(cri);
		}
		
		/* 쿠키 도전중  start 
		Cookie recentCookie = new Cookie(p_id, null);
		recentCookie.setPath("/");
		recentCookie.setMaxAge(0);
		response.addCookie(recentCookie);
		recentCookie = new Cookie(p_id, p_id);
		recentCookie.setPath("/");
		recentCookie.setMaxAge(60*60*24*3);
		response.addCookie(recentCookie);
		
		Cookie[] recentArray = request.getCookies();
		int recentCount = productDAO.recentCookie(recentArray, (page-1)*limit, listCount));
		
		List<ProductVO> list = productDAO.productList(cri);			
		쿠키 도전중  end */		
		
		
		model.addAttribute("productList", list);
		PageMaker pageMaker = new PageMaker(cri);
		int totalCount = productDAO.countProductListTotal(cri);
		int countSmartPhone = productDAO.countSmartPhone();
		int countLaptop = productDAO.countLaptop();
		int countCamera = productDAO.countCamera();
		int countWatch = productDAO.countWatch();
		int countTablet = productDAO.countTablet();
		
		
		pageMaker.setTotalCount(pageCount);
		System.out.println("getMemberPostProductList :: pageMaker : " + pageMaker.toString());
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("countSmartPhone", countSmartPhone);
		model.addAttribute("countLaptop", countLaptop);
		model.addAttribute("countCamera", countCamera);
		model.addAttribute("countWatch", countWatch);
		model.addAttribute("countTablet", countTablet);
		
		return "member/pro/memberProductList";
	}
	
	/*
	 * // 신영-고객쪽 상품리스트(카테고리별)
	 * 
	 * @RequestMapping(value = "/member/pro/productList/{p_category}", method =
	 * RequestMethod.GET) public String getProductCateList(Model model, Criteria
	 * cri, @PathVariable String p_category ) { ProductDAO productDAO =
	 * sqlSessionTemplate.getMapper(ProductDAO.class);
	 * System.out.println("getProductCateList :: category 눌렀을때 오는 곳 ");
	 * cri.setKeyword(p_category);
	 * 
	 * List<ProductVO> list = productDAO.productList(cri);
	 * 
	 * 
	 * model.addAttribute("productList", list); PageMaker pageMaker = new
	 * PageMaker(cri); int totalCount = productDAO.countProductListTotal(cri); int
	 * countSmartPhone = productDAO.countSmartPhone(); int countLaptop =
	 * productDAO.countLaptop(); int countCamera = productDAO.countCamera(); int
	 * countWatch = productDAO.countWatch(); int countTablet =
	 * productDAO.countTablet();
	 * 
	 * int pageCount = productDAO.countProductListTotalBySearchKeyword(cri);
	 * pageMaker.setTotalCount(pageCount);
	 * System.out.println("getProductCateList :: cri : " + cri.toString());
	 * System.err.println("getProductCateList :: pageMaker : " +
	 * pageMaker.toString());
	 * 
	 * model.addAttribute("pageMaker", pageMaker); model.addAttribute("totalCount",
	 * totalCount); model.addAttribute("countSmartPhone", countSmartPhone);
	 * model.addAttribute("countLaptop", countLaptop);
	 * model.addAttribute("countCamera", countCamera);
	 * model.addAttribute("countWatch", countWatch);
	 * model.addAttribute("countTablet", countTablet);
	 * model.addAttribute("p_category", cri.getP_category());
	 * 
	 * return "/member/pro/memberProductList"; }
	 * 
	 * // 신영-고객쪽 상품리스트(색상 별)
	 * 
	 * @RequestMapping(value = "/member/pro/productList/color/{p_categoryColor}",
	 * method = RequestMethod.GET) public String getProductCateColor(Model model,
	 * Criteria cri, @PathVariable String p_categoryColor) {
	 * model.addAttribute("color",p_categoryColor); ProductVO productVO = new
	 * ProductVO(); ProductDAO productDAO =
	 * sqlSessionTemplate.getMapper(ProductDAO.class); //카테고리가 블랙/레드/화이트/실버면,
	 * if((p_categoryColor.equals("black")) || (p_categoryColor.equals("red")) ||
	 * (p_categoryColor.equals("white")) || (p_categoryColor.equals("silver"))){
	 * if(p_categoryColor.equals("black")) { p_categoryColor =
	 * productVO.setP_categoryColor("블랙");
	 * cri.setP_categoryColor("p_categoryColor");
	 * System.out.println(p_categoryColor); }else if(p_categoryColor.equals("red"))
	 * { p_categoryColor = productVO.setP_categoryColor("레드");
	 * cri.setP_categoryColor("p_categoryColor");
	 * System.out.println(p_categoryColor); }else
	 * if(p_categoryColor.equals("white")) { p_categoryColor =
	 * productVO.setP_categoryColor("화이트");
	 * cri.setP_categoryColor("p_categoryColor");
	 * System.out.println(p_categoryColor); }else
	 * if(p_categoryColor.equals("silver")) { p_categoryColor =
	 * productVO.setP_categoryColor("실버");
	 * cri.setP_categoryColor("p_categoryColor");
	 * System.out.println(p_categoryColor); }
	 * 
	 * //model.addAttribute("color",p_categoryColor); int colorCount =
	 * productDAO.colorTotal(cri,p_categoryColor);
	 * cri.setP_categoryColor(p_categoryColor);
	 * System.out.println("cri.setP_categoryColor(p_categoryColor)::" +
	 * cri.getP_categoryColor()); System.out.println("colorCount:::" + colorCount);
	 * 
	 * 
	 * System.out.println(cri.getP_categoryColor());
	 * System.out.println(cri.getPage()); List<ProductVO> list =
	 * productDAO.productSelectColor(cri);
	 * 
	 * System.out.println("listp_catesize:::" + list.size());
	 * System.out.println("Math.ceil(cate_totalCount/9):::" +
	 * (int)(Math.ceil((double)colorCount/9)));
	 * 
	 * model.addAttribute("size" , (int)(Math.ceil((double)colorCount/9)));
	 * 
	 * 
	 * model.addAttribute("productList", list); System.out.println("list.toString()"
	 * + list.toString()); PageMaker pageMaker = new PageMaker(cri);
	 * System.out.println(cri.toString()); int totalCount =
	 * productDAO.colorTotal(cri,p_categoryColor); System.out.println("totalCount::"
	 * + totalCount); int countSmartPhone = productDAO.countSmartPhone(); int
	 * countLaptop = productDAO.countLaptop(); int countCamera =
	 * productDAO.countCamera(); int countWatch = productDAO.countWatch(); int
	 * countTablet = productDAO.countTablet(); pageMaker.setTotalCount(totalCount);
	 * System.out.println(pageMaker.toString()); model.addAttribute("pageMaker",
	 * pageMaker); model.addAttribute("totalCount", totalCount);
	 * model.addAttribute("countSmartPhone", countSmartPhone);
	 * model.addAttribute("countLaptop", countLaptop);
	 * model.addAttribute("countCamera", countCamera);
	 * model.addAttribute("countWatch", countWatch);
	 * model.addAttribute("countTablet", countTablet);
	 * 
	 * 
	 * 
	 * } return "member/pro/memberProductList"; }
	 * 
	 * 
	 * // 신영-상품정렬
	 * 
	 * @RequestMapping(value = "/member/pro/productList/sort/{sort}", method =
	 * RequestMethod.GET) public String sort(Model model,Criteria cri, @PathVariable
	 * String sort) { ProductDAO productDAO =
	 * sqlSessionTemplate.getMapper(ProductDAO.class);
	 * 
	 * System.out.println("sort:::" + sort); int sortCount =
	 * productDAO.countProductListTotal(cri); cri.setSort(sort);
	 * System.out.println("cri.getSort::" + cri.getSort());
	 * System.out.println("sortCount:::" + sortCount);
	 * 
	 * 
	 * if(cri.getPage() == 0) { cri.setPage(0); }else if(0 < cri.getPage() &&
	 * cri.getPage() < 2) { System.out.println("cri.getPage()::" + cri.getPage());
	 * cri.setPage((cri.getPage()*1-1));
	 * 
	 * }else if(cri.getPage() > 2) { System.out.println(" page0");
	 * cri.setPage((cri.getPage()*10-11)); }
	 * 
	 * cri.setPerPageNum(9);
	 * 
	 * System.out.println(cri.getP_category()); System.out.println(cri.getPage());
	 * 
	 * if(sort.equals("pricelow")) { List<ProductVO> list =
	 * productDAO.productSortLow(cri); model.addAttribute("productList", list);
	 * System.out.println("pricelow size:::" + list.size()); } else
	 * if(sort.equals("pricehigh")){ List<ProductVO> rlist =
	 * productDAO.productSortHigh(cri); model.addAttribute("productList", rlist);
	 * System.out.println("pricehigh size:::" + rlist.size()); } else
	 * if(sort.equals("recommand")){ List<ProductVO> rclist =
	 * productDAO.productRecommand(cri); model.addAttribute("productList", rclist);
	 * System.out.println("recommand size:::" + rclist.size()); }
	 * 
	 * //System.out.println("listp_catesize:::" + list.size());
	 * System.out.println("Math.ceil(cate_totalCount/9):::" +
	 * (int)(Math.ceil((double)sortCount/9)));
	 * 
	 * model.addAttribute("size" , (int)(Math.ceil((double)sortCount/9)));
	 * model.addAttribute("sort",sort);
	 * 
	 * 
	 * 
	 * 
	 * 
	 * return "member/pro/memberProductList2"; }
	 */
  	
	  //신영-메뉴바 가격조회
	  @RequestMapping(value = "/member/pro/productList/priceSearchRent/{minPrice}/{maxPrice}", method = RequestMethod.GET)
	  public String sort(Model model,Criteria cri, @PathVariable String minPrice,@PathVariable String maxPrice) { 		  
	  ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
	  System.out.println(minPrice + maxPrice);
	  List<ProductVO> pslist = productDAO.productMenubarPriceSearchRent(minPrice,maxPrice);
	  model.addAttribute("productList", pslist);		  
	  return "member/pro/memberProductList2";
	  }	
	  
	//신영-메뉴바 가격조회
	  @RequestMapping(value = "/member/pro/productList/priceSearchBuy/{minPrice}/{maxPrice}", method = RequestMethod.GET)
	  public String sortlist(Model model,Criteria cri, @PathVariable String minPrice,@PathVariable String maxPrice) { 		  
	  ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
	  System.out.println(minPrice + maxPrice);	 
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
	
			/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~병찬 고객 시작~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
			
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
			@RequestMapping(value = "/member/cartInsert", method = RequestMethod.POST)
			public String CartInsert(CartVO cartVO, HttpSession session, @RequestParam String p_id, @RequestParam int amount,String c_state, String requestRentDate ) {
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
			//비로그인에서 장바구니추가
			@RequestMapping(value = "/member/cartInsert/{p_id}/{amount}/{requestRentDate}/{c_state}", method = RequestMethod.GET)
			public String CartLoginInsert(CartVO cartVO, HttpSession session, @PathVariable String p_id, @PathVariable int amount,@PathVariable String c_state,@PathVariable String requestRentDate ) {
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
					return "redirect:/member/pro/productDetail/"+p_id;
			}
			//비로그인에서 위시리스트추가
			@RequestMapping(value = "/member/wishListInsert/{p_id}", method = RequestMethod.GET)
			public String WishListLoginInsert(WishListVO wishListVO, HttpSession session, @PathVariable String p_id ) {					
				UserInfoVO userInfo = (UserInfoVO) session.getAttribute("userInfo");
				String userId=userInfo.getM_id();				
				String w_mid = userId;
				wishListVO.setW_mid(w_mid);
				wishListVO.setW_pid(p_id);
				ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
				int n = productDAO.wishListInsert(wishListVO);
				 if(n==0) {System.out.println("등록 실패");}
				return "redirect:/member/pro/productDetail/"+p_id;
				}
			//비로그인에서 결제버튼으로 결제폼이동
			@RequestMapping(value = "/member/rent/buy/{productId}/{productImg}/{productPrice}/{buyType}/{proamount}/{rentdate}")
			public String customerBuyForm(@ModelAttribute("BuyInfoVO") BuyInfoVO buyInfoVO,Model model, HttpSession session, @PathVariable String productId, @PathVariable String productImg, @PathVariable int productPrice, @PathVariable String buyType, @PathVariable int proamount, @PathVariable String rentdate) {
				
				//세션에서 해당 회원의 아이디 받음
				UserInfoVO userInfo=(UserInfoVO)session.getAttribute("userInfo");
				String userId=userInfo.getM_id();
				
				RentDAO rentDAO = sqlSessionTemplate.getMapper(RentDAO.class);
				UserDAO userDAO = sqlSessionTemplate.getMapper(UserDAO.class);
				ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
				
				
				// 제품 아이디로 해당 제품 정보 끌어옴
				ProductVO productVO = productDAO.productInfo(productId);
				//나머지 필요한 제품 정보들 BuyInfoBean에 setter로 넣어줌 
				buyInfoVO.setProductId(productId);
				buyInfoVO.setBuyType(buyType);
				buyInfoVO.setProamount(proamount);
				buyInfoVO.setRentdate(rentdate);
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
			
			
			
			//고객 상품상세보기 
			  @RequestMapping(value = "/member/pro/productDetail/{p_id}", method = RequestMethod.GET)
				public String memberProductDetail(@ModelAttribute BuyInfoVO buyInfoVO, HttpSession session, Model model, @PathVariable String p_id, Criteria cri) {
				    if (session.getAttribute("userInfo") != null) {
				    	UserInfoVO userInfo = (UserInfoVO) session.getAttribute("userInfo");
						String userId=userInfo.getM_id();						  
					  	String w_mid = userId;
						String w_pid = p_id;						
						String r_pid = p_id;
						String v_pid =  p_id;
						String c_pid =  p_id;
						String c_mid =  userId;
						cri.setV_pid(p_id);
						

						
						ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
						UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);
						UserVO userVO = dao.userInfo(userId);
						model.addAttribute("userVO", userVO);
						ProductVO productVO = productDAO.productInfo(p_id);
						//위시리스트 체크
						WishListVO wishListVO = productDAO.checkWishList(w_pid,w_mid);
						//장바구니 체크
						CartVO cartVO = productDAO.checkCart(c_pid,c_mid);
						model.addAttribute("cartVO", cartVO);
						//리뷰용 추가							
						int reviewCount = productDAO.reviewCount(v_pid);
						List<RecVO> recVO = productDAO.reviewList(cri,v_pid);	
						model.addAttribute("recVO", recVO);
						RecVO oneReview = productDAO.oneReview(v_pid,userId);						
						PageMaker pageMaker = new PageMaker(cri);
						int totalCount = productDAO.countReviewListTotal(cri,v_pid);
						pageMaker.setTotalCount(totalCount);
						model.addAttribute("pageMaker", pageMaker);
						//렌탈리스트
						List<RentVO> rentVO = productDAO.selectedRentalList(r_pid);	
						model.addAttribute("rentalListNow", rentVO);
						
						model.addAttribute("userId", userId);
						model.addAttribute("productVO", productVO);
						model.addAttribute("wishListVO", wishListVO);
						model.addAttribute("buyInfoVO", buyInfoVO);
						model.addAttribute("reviewCount", reviewCount);
						model.addAttribute("oneReview", oneReview);
					
						
						
				    } else {
				    	cri.setV_pid(p_id);						
						String r_pid = p_id;
						String v_pid =  p_id;
						ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
						ProductVO productVO = productDAO.productInfo(p_id);
						int reviewCount = productDAO.reviewCount(v_pid);
						List<RecVO> recVO = productDAO.reviewList(cri,v_pid);	
						model.addAttribute("recVO", recVO);
						PageMaker pageMaker = new PageMaker(cri);
						int totalCount = productDAO.countReviewListTotal(cri,v_pid);
						pageMaker.setTotalCount(totalCount);
						model.addAttribute("pageMaker", pageMaker);
						List<RentVO> rentVO = productDAO.selectedRentalList(r_pid);	
						model.addAttribute("rentalListNow", rentVO);
						
						
						model.addAttribute("reviewCount", reviewCount);
						model.addAttribute("productVO", productVO);
						model.addAttribute("buyInfoVO", buyInfoVO);
				    }
				    return "/member/pro/memberProductDetail2";					
				}	
			  //페이지 눌렀을때
			  @RequestMapping(value = "/member/pro/productDetail", method = RequestMethod.GET)
				public String memberProductDetailReviewPage(@ModelAttribute BuyInfoVO buyInfoVO, HttpSession session, Model model, @RequestParam String v_pid,@RequestParam String page,@RequestParam String perPageNum,Criteria cri) {					
				  if (session.getAttribute("userInfo") != null) {
				    	UserInfoVO userInfo = (UserInfoVO) session.getAttribute("userInfo");
						String userId=userInfo.getM_id();						  
					  	String w_mid = userId;
						String w_pid = v_pid;
						String r_pid = v_pid; 
						String c_pid =  v_pid;
						String c_mid =  userId;
						cri.setV_pid(v_pid);	
						ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
						ProductVO productVO = productDAO.productInfo(v_pid);
						WishListVO wishListVO = productDAO.checkWishList(w_pid,w_mid);
						CartVO cartVO = productDAO.checkCart(c_pid,c_mid);
						model.addAttribute("cartVO", cartVO);
						int reviewCount = productDAO.reviewCount(v_pid);
						//리뷰용 추가
						
						List<RecVO> recVO = productDAO.reviewPagingList(cri,v_pid);	
						model.addAttribute("recVO", recVO);							
						RecVO oneReview = productDAO.oneReview(v_pid,userId);
						PageMaker pageMaker = new PageMaker(cri);
						int totalCount = productDAO.countReviewListPagingTotal(cri,v_pid);
						pageMaker.setTotalCount(totalCount);
						model.addAttribute("pageMaker", pageMaker);
						
						List<RentVO> rentVO = productDAO.selectedRentalList(r_pid);	
						model.addAttribute("rentalListNow", rentVO);
						
						UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);
						UserVO userVO = dao.userInfo(userId);
						model.addAttribute("userVO", userVO);
						model.addAttribute("productVO", productVO);
						model.addAttribute("wishListVO", wishListVO);
						model.addAttribute("buyInfoVO", buyInfoVO);
						model.addAttribute("reviewCount", reviewCount);
						model.addAttribute("oneReview", oneReview);
						model.addAttribute("userId", userId);

						
				    } else {

				    	cri.setV_pid(v_pid);	
						String r_pid = v_pid; 
						ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
						ProductVO productVO = productDAO.productInfo(v_pid);
						int reviewCount = productDAO.reviewCount(v_pid);
						
		
						List<RecVO> recVO = productDAO.reviewPagingList(cri,v_pid);	
						model.addAttribute("recVO", recVO);
						PageMaker pageMaker = new PageMaker(cri);
						int totalCount = productDAO.countReviewListPagingTotal(cri,v_pid);
						pageMaker.setTotalCount(totalCount);
						model.addAttribute("pageMaker", pageMaker);
						
						List<RentVO> rentVO = productDAO.selectedRentalList(r_pid);	
						model.addAttribute("rentalListNow", rentVO);
						
						model.addAttribute("productVO", productVO);
						model.addAttribute("reviewCount", reviewCount);
						model.addAttribute("buyInfoVO", buyInfoVO);
				    }
				    return "/member/pro/memberProductDetail2";					
				}	
			 //리뷰 폼
			    @RequestMapping(value = "/member/recommendForm/{p_id}", method = RequestMethod.GET)
				public void reviewInsertForm(RecVO recVO, HttpSession session, Model model, @PathVariable String p_id) {	
			    	UserInfoVO userInfo = (UserInfoVO) session.getAttribute("userInfo");
					String userId=userInfo.getM_id();
					UserDAO dao = sqlSessionTemplate.getMapper(UserDAO.class);
					UserVO userVO = dao.userInfo(userId);
					model.addAttribute("userVO", userVO);
					model.addAttribute("p_id", p_id);
					//return "/member/pro/reviewInsertForm";
				}
			  
			  //상세페이지에서 리뷰(추천글) 작성
			  @RequestMapping(value = "/member/pro/reviewInsert", method = RequestMethod.POST)
				public String reviewInsert(@ModelAttribute RecVO recVO) {
					ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);	
					int n = productDAO.reviewInsert(recVO);
					if (n == 0) {
						System.out.println("등록 실패");
					}
					return "redirect:/member/pro/productDetail/"+recVO.getV_pid();
				}
			  //상세페이지에서 리뷰 업데이트
			  @RequestMapping(value = "/member/pro/reviewUpdate", method = RequestMethod.POST)
				public String reviewUpdate(@ModelAttribute RecVO recVO) {
					ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);	
					int n = productDAO.reviewUpdate(recVO);
					if (n == 0) {
						System.out.println("등록 실패");
					}
					return "redirect:/member/pro/productDetail/"+recVO.getV_pid()+"#reviewTop";
				}
			  //상세페이지에서 삭제
			  @RequestMapping(value = "/member/pro/reviewDelete/{v_mid}/{v_pid}", method = RequestMethod.POST)
				public String reviewDelete(@PathVariable String v_mid , @PathVariable String v_pid) {
					ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);	
					int n = productDAO.reviewDelete(v_mid,v_pid);
					if (n == 0) {
						System.out.println("등록 실패");
					}
					return "redirect:/member/pro/productDetail/"+v_pid+"#reviewTop";
				}
			  
			  
			  								
	}		