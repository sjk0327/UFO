package com.use.first.product;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

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
	

	// 신영-상품리스트
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
		
		// 신영-상품등록
		@RequestMapping(value="/admin/pro/productInsertForm", method=RequestMethod.GET)
		public String productInsertForm(ProductVO productVO) {
			return "admin/pro/adminProductInsertForm";
		}
		@RequestMapping(value = "/admin/pro/productInsert", method = RequestMethod.POST)
		public String productInsert(ProductVO productVO) throws IOException {
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
			int n = productDAO.productInsert(productVO);
		
			 if(n==0) {System.out.println("등록 실패");}
			return "redirect:/admin/pro/productList";
		}

		// 신영-상품리스트-다중선택삭제
		@RequestMapping(value = "/admin/pro/productDelete2", method = RequestMethod.GET)
		public String adminProductSelectDelete(@RequestParam HashMap<String, Object> commandMap) {
			ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
			
			String[] code_array = null;
			 
	        String code = commandMap.get("arrayParam").toString();	        
	        //System.out.println("code:" + code);	        
	        
	        code_array = code.split(",");
	        
	        for(int i=0; i< code_array.length; i++) {
	        	System.out.println("code_array[]::::" + code_array[i]);
	        	productDAO.deleteById(code_array[i]);	
	        }        
			return "redirect:/admin/pro/productList";
		}
		//신영-고객쪽 상품리스트
		@RequestMapping(value = "/member/pro/productList",method = RequestMethod.GET)
		public String getMemberProductList(Model model,Criteria cri) {
			ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
			// 현재 페이지에 해당하는 게시물을 조회해 옴
			List<ProductVO> list = productDAO.productList(cri);
			model.addAttribute("productList", list);
			PageMaker pageMaker = new PageMaker(cri);
			int totalCount = productDAO.countProductListTotal(cri);
			pageMaker.setTotalCount(totalCount);
			//pageMaker.setTotalCount(productDAO.countProductListTotal());
			model.addAttribute("pageMaker", pageMaker);
			
			return "member/pro/memberProductList";
		}
		//신영-고객쪽 상품리스트
		@RequestMapping(value = "/member/pro/productList",method = RequestMethod.POST)
		public String getMemberProductSearch(Model model,Criteria cri) {
			ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
			System.out.println("여긴 오니?");
			List<ProductVO> list = productDAO.productList(cri);
			model.addAttribute("productList", list);
			PageMaker pageMaker = new PageMaker(cri);
			int totalCount = productDAO.countProductListTotal(cri);
			System.out.println("totalCount:::" + totalCount);
			pageMaker.setTotalCount(totalCount);
			
			model.addAttribute("pageMaker", pageMaker);
			model.addAttribute("totalCount", totalCount);
			return "member/pro/memberProductList";
		}
	
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
		//고객 상품상세보기 작업중
		@RequestMapping(value = "/member/pro/productDetail/{p_id}", method = RequestMethod.GET)
		public String memberProductDetail(Model model, @PathVariable String p_id) {
			ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
			ProductVO productVO = productDAO.productInfo(p_id);
			model.addAttribute("productVO", productVO);
			return "/member/pro/memberProductDetail";
		}		
	}

