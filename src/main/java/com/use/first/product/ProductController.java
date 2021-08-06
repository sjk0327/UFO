package com.use.first.product;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ProductController {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
 
	

	//신영-상품리스트
	@RequestMapping("/admin/pro/productList")
	public String getProductList(Model model) {
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		List<ProductVO> list = productDAO.productList();
		model.addAttribute("productList", list);
		return "admin/pro/adminProductList";
	}
	/*
	 * //상품등록
	 * 
	 * @RequestMapping(value="/admin/pro/productInsert", method=RequestMethod.POST)
	 * public String productInsert(ProductVO productVO) { ProductDAO productDAO =
	 * sqlSessionTemplate.getMapper(ProductDAO.class); int n =
	 * productDAO.insert(productVO); return "redirect:/admin/pro/productList"; }
	 * //상품수정
	 * 
	 * @RequestMapping(value = "/admin/pro/productUpdate/selectID/{p_id}", method =
	 * RequestMethod.POST) public String productUpdate(Model model,ProductVO
	 * productVO) { ProductDAO productDAO =
	 * sqlSessionTemplate.getMapper(ProductDAO.class); int n =
	 * productDAO.update(productVO); if(n == 0) { System.out.println("update 실패"); }
	 * model.addAttribute("p_id", productVO.getP_id()); return
	 * "redirect:/admin/pro/productList"; }
	 */

	//상품상세보기
	@RequestMapping(value = "/admin/pro/productDetail/{p_id}", method = RequestMethod.GET)
	public String adminProductDetail(Model model, @PathVariable String p_id) {
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		ProductVO productVO = productDAO.productInfo(p_id);
		model.addAttribute("productInfo", productVO);
		return "admin/pro/adminProductDetail";
	}
	//상품삭제. 하는중
	@RequestMapping(value = "/admin/pro/productDelete/{p_id}", method = RequestMethod.GET)			
	public String adminProductDelete(@PathVariable String p_id) {
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		int n = productDAO.productDelete(p_id);
		return "redirect:/admin/pro/programList";
	}

	
	//상품수정. 하는중
	@RequestMapping(value = "/admin/pro/productUpdate")
	public String adminProductUpdate(Model model, ProductVO productVO, @PathVariable String p_id) {
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		int n = productDAO.productUpdate(productVO);
		if(n != 1) {
			//업데이트 실패 시
			
		}		
		return "admin/pro/adminProductDetail/";
	}
	//상품수정. 하는중
	/*
	@RequestMapping(value = "/admin/pro/productUpdate")			
	public String adminProductUpdate(Model model, ProductVO productVO) {
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		int n = productDAO.productUpdate(productVO);
		model.addAttribute("p_id", productVO.getP_id());
		return "admin/pro/adminProductDetail";
	}
	*/
}
