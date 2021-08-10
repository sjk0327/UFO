package com.use.first.product;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.use.first.paging.Criteria;
import com.use.first.paging.PageMaker;


@Controller
public class ProductController {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
		//신영-관리자 상품리스트
		@RequestMapping(value = "/admin/pro/productList",method = RequestMethod.GET)
		public String getProductList(Model model,Criteria cri) {
			ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
			// 현재 페이지에 해당하는 게시물을 조회해 옴
			List<ProductVO> list = productDAO.productList(cri);
			model.addAttribute("productList", list);
			PageMaker pageMaker = new PageMaker(cri);
			int totalCount = productDAO.countProductListTotal(cri);
			pageMaker.setTotalCount(totalCount);
			//pageMaker.setTotalCount(productDAO.countProductListTotal());
			model.addAttribute("pageMaker", pageMaker);
			
			return "admin/pro/adminProductList";
		}
		//신영-관리자 상품리스트
		@RequestMapping(value = "/admin/pro/productList",method = RequestMethod.POST)
		public String getProductSearch(Model model,Criteria cri) {
			ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
			// 현재 페이지에 해당하는 게시물을 조회해 옴
			List<ProductVO> list = productDAO.productList(cri);
			model.addAttribute("productList", list);
			//김수정 병합중 페이지메이커 공통부분으로 옮기면서 오류나서 일단 주석처리함 0807오전9시
			PageMaker pageMaker = new PageMaker(cri);
			int totalCount = productDAO.countProductListTotal(cri);
			pageMaker.setTotalCount(totalCount);
			//pageMaker.setTotalCount(productDAO.countProductListTotal());
			model.addAttribute("pageMaker", pageMaker);
			
			return "admin/pro/adminProductList";
		}
		
		// 신영-관리자 상품등록
		@RequestMapping(value="/admin/pro/productInsertForm", method=RequestMethod.GET)
		public String productInsertForm(ProductVO productVO) {
			return "admin/pro/adminProductInsertForm";
		}
		// 신영-관리자 상품등록
		@RequestMapping(value = "/admin/pro/productInsert", method = RequestMethod.POST)
		public String productInsert(ProductVO productVO) throws IOException {
			MultipartFile mainFile = productVO.getMainFile();
			if(!mainFile.isEmpty()) {
				String mainFileName = mainFile.getOriginalFilename();
				mainFile.transferTo(new File(
						"C:\\FinalProject\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\UFO\\resources\\Images\\product\\" + mainFileName));
				productVO.setP_mainImg(mainFileName);
			}
			MultipartFile subFile = productVO.getSubFile();
			if(!subFile.isEmpty()) {
				String subFileName = subFile.getOriginalFilename();
				subFile.transferTo(new File(
						"C:\\FinalProject\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\UFO\\resources\\Images\\product\\" + subFileName));
				productVO.setP_subImg(subFileName);
			}
			ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
			int n = productDAO.productInsert(productVO);
		
			 if(n==0) {System.out.println("등록 실패");}
			return "redirect:/admin/pro/productList";
		}

		// 신영-관리자 상품리스트-다중선택삭제
		@RequestMapping(value = "/admin/pro/productDelete2", method = RequestMethod.GET)
		public String adminProductSelectDelete(@RequestParam HashMap<String, Object> commandMap) {
			ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
			String[] code_array = null;			
	        String code = commandMap.get("arrayParam").toString();	     
	        code_array = code.split(",");
	        for(int i=0; i< code_array.length; i++) {
        	System.out.println("code_array[]::::" + code_array[i]);
        	productDAO.deleteById(code_array[i]);	
	        }        
			return "redirect:/admin/pro/productList";
		}
		//신영 관리자상품리스트에서 한줄 수량관련 수정 -수정중
				@RequestMapping(value = "/admin/pro/productUpdate2/{p_id}/{p_canBuy}/{p_canRent}", method = RequestMethod.GET)			
				public String adminProductUpdate2(ProductVO productVO, @PathVariable String p_id) {
					System.out.println("adminProductUpdate2 왔니?");
					ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
					int n = productDAO.productUpdate2(productVO);
					if (n != 1) {
						// 업데이트 실패 시
						System.out.println("adminProductUpdate2 // 상품 수정 실패 // " + productVO.toString());
					}	
					return "redirect:/admin/pro/productList/";
				}
		/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~신영 회원 시작~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
		
		//신영-고객쪽 상품리스트
		@RequestMapping(value = "/member/pro/productList",method = RequestMethod.GET)
		public String getMemberProductList(ProductVO productVO, Model model,Criteria cri) {
			ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
			List<ProductVO> list = productDAO.productList(cri);
			
			//for(int i=0; i<list.size(); i++) {
			//ProductVO listarr = list.get(i);
			//}
			//model.addAttribute("listarr", );
			model.addAttribute("productList", list);
			PageMaker pageMaker = new PageMaker(cri);
			int totalCount = productDAO.countProductListTotal(cri);
			int totalCategoryCount = productDAO.countProductListCategory();
			pageMaker.setTotalCount(totalCount);
			//pageMaker.setTotalCount(productDAO.countProductListTotal());
			model.addAttribute("pageMaker", pageMaker);
			model.addAttribute("totalCount", totalCount);
			model.addAttribute("totalCategoryCount", totalCategoryCount);
			System.out.println("totalCount:::" +totalCount);
			System.out.println("totalCategoryCount:::" +totalCategoryCount);
			return "member/pro/memberProductList";
		}
	
		//신영-고객쪽 상품리스트(카테고리별)
		@RequestMapping(value = "/member/pro/productList/{p_category}", method = RequestMethod.GET)
		public String getMemberProductCategory(ProductVO productVO,Model model,Criteria cri) {
			
			System.out.println("카테고리로 오니?");
			ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);			
			List<ProductVO> list = productDAO.productList(cri);
			model.addAttribute("productList", list);
			PageMaker pageMaker = new PageMaker(cri);
			int totalCount = productDAO.countProductListTotal(cri);
			pageMaker.setTotalCount(totalCount);
			model.addAttribute("productVO", productVO);
			model.addAttribute("pageMaker", pageMaker);
			System.out.println("productVO.getP_category()::::" + productVO.getP_category());
			return "member/pro/memberProductList";
			}
		
	
	
		
		
				
		/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~병찬 관리자 시작~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
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
		/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~병찬 회원 시작~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ */
		//고객 상품상세보기 작업중
		@RequestMapping(value = "/member/pro/productDetail/{p_id}", method = RequestMethod.GET)
		public String memberProductDetail(Model model, @PathVariable String p_id) {
			ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
			ProductVO productVO = productDAO.productInfo(p_id);
			model.addAttribute("productVO", productVO);
			return "/member/pro/memberProductDetail";
		}		
	}

