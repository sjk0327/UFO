package com.use.first.product;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class productController {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	// 설정파일에 빈으로 등록되었기 때문에 생성자나 Setter 없이 자동으로 주입

	@RequestMapping("/member/pro/empList")
	public String getEmpList(Model model) {
		productDAO dao = sqlSessionTemplate.getMapper(productDAO.class);
		List<productVO> list = dao.list();
		model.addAttribute("empList", list);
		return "member/pro/empList";
	}

}
