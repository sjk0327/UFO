package com.use.first.product;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ProductController {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
		
	@RequestMapping("/adminsite/adminProductDetail")
	public String getProduct(Model model, @RequestParam String p_id) {
		ProductDAO productDAO = sqlSessionTemplate.getMapper(ProductDAO.class);
		ProductVO productVO = productDAO.info(p_id);
		model.addAttribute("productInfo", productVO);
		return "admin/pro/adminProductDetail";
	}
	
}
