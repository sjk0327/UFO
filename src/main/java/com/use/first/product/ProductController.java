package com.use.first.product;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.use.first.paging.Criteria;

@Controller
public class ProductController {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	


	// 신영-상품리스트
		@RequestMapping(value = "/admin/pro/productList",method = RequestMethod.GET)
		public String getProductList(Model model,Criteria cri) {
			ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
			List<ProductVO> list = productDAO.productList(cri);

//김수정 병합중 페이지메이커 공통부분으로 옮기면서 오류나서 일단 주석처리함 0807오전9시
//			PageMaker pageMaker = new PageMaker();
//			pageMaker.setCri(cri);
//			pageMaker.setTotalCount(productDAO.countProductListTotal());

			model.addAttribute("productList", list);
			//model.addAttribute("pageMaker", pageMaker);
			
			return "admin/pro/adminProductList";
		}

		// 신영-상품등록
		@RequestMapping(value="/admin/pro/productInsertForm", method=RequestMethod.GET)
		public String productInsertForm(ProductVO productVO) {
			return "admin/pro/adminProductInsertForm";
		}
		@RequestMapping(value = "/admin/pro/productInsert", method = RequestMethod.POST)
		public String productInsert(ProductVO productVO) {
			ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
			int n = productDAO.productInsert(productVO);
			/*
			 * System.out.println("id" + productVO.getP_id()); System.out.println("id" +
			 * productVO.getP_name());
			 */
			 if(n==0) {System.out.println("등록 실패");}
			return "redirect:/admin/pro/productList";
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

	
	//상품수정. 하는중
	
	@RequestMapping(value = "/admin/pro/productUpdate/{product_id}", method = RequestMethod.POST)
	public String adminProductUpdate(Model model, ProductVO productVO, @PathVariable String product_id) throws IOException{
		
		MultipartFile mainFile = productVO.getMainFile();
		if(!mainFile.isEmpty()) {
			String fileName = mainFile.getOriginalFilename();
			mainFile.transferTo(new File("D:/" + fileName));
			productVO.setP_mainImg(fileName);
		}
		
		
		
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		
		int n = productDAO.productUpdate(productVO);
		if (n != 1) {
			// 업데이트 실패 시
			System.out.println("adminProductUpdate // 상품 수정 실패 // " + productVO.toString());
		}	
		return "redirect:/admin/pro/productDetail/"+ product_id;
	}
	
}
