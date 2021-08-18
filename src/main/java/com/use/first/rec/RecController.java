package com.use.first.rec;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.use.first.paging.Criteria;
import com.use.first.paging.PageMaker;
import com.use.first.rent.RentDAO;
import com.use.first.rent.RentVO;

@Controller
public class RecController {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@RequestMapping(value = "/admin/rec/recList", method = RequestMethod.GET)
	public String adminRecList(Criteria cri, Model model) {
		RecDAO recDAO = sqlSessionTemplate.getMapper(RecDAO.class);

		// 현재 페이지에 해당하는 게시물을 조회해 옴
		List<RecVO> list = recDAO.recList(cri);
		// 모델에 추가
		model.addAttribute("recList", list);
		// PageMaker 객체 생성
		PageMaker pageMaker = new PageMaker(cri);
		// 전체 게시물 수를 구함
		int totalCount = recDAO.getRecTotalCount(cri);
		// pageMaker로 전달
		pageMaker.setTotalCount(totalCount);
		// 모델에 추가
		model.addAttribute("pageMaker", pageMaker);
		return "/admin/rec/adminRecList";
	}
	
	@RequestMapping(value = "/admin/rec/recList", method = RequestMethod.POST)
	public String adminRecListSearch(Criteria cri, Model model) {
		RecDAO recDAO = sqlSessionTemplate.getMapper(RecDAO.class);

		// 현재 페이지에 해당하는 게시물을 조회해 옴
		List<RecVO> list = recDAO.recList(cri);
		// 모델에 추가
		model.addAttribute("recList", list);
		// PageMaker 객체 생성
		PageMaker pageMaker = new PageMaker(cri);
		// 전체 게시물 수를 구함
		int totalCount = recDAO.getRecTotalCount(cri);
		// pageMaker로 전달
		pageMaker.setTotalCount(totalCount);
		// 모델에 추가
		model.addAttribute("pageMaker", pageMaker);
		return "/admin/rec/adminRecList";
	}
	
	@RequestMapping(value = "/admin/rec/recUpdate/{v_id}")
	public String adminRecUpdate(Model model, RecVO recVO, @PathVariable int v_id) {
		RecDAO recDAO = sqlSessionTemplate.getMapper(RecDAO.class);
		
		String content = "관리자에 의해 삭제된 코멘트 입니다.";
		
		recDAO.recUpdate(v_id, content);
		
		return "redirect:/admin/rec/recList";
	}

}
