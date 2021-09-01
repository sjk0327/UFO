package com.use.first.qna;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.use.first.paging.Criteria;
import com.use.first.paging.PageMaker;

@Controller
public class QnaController {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@RequestMapping(value = "/member/qnaList", method = RequestMethod.GET)
	public String memberQnaList(Criteria cri, Model model) {
		QnaDAO qnaDAO = sqlSessionTemplate.getMapper(QnaDAO.class);
		List<QnaVO> qnaList = qnaDAO.qnaList(cri);
		model.addAttribute("qnaList", qnaList);
		PageMaker pageMaker = new PageMaker(cri);
		int totalCount = qnaDAO.getQnaTotalCount(cri);
		pageMaker.setTotalCount(totalCount);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("pageMaker", pageMaker);
		return "/member/qna/memberQnaList";
	}
	
	
	@RequestMapping(value = "/admin/qnaList", method = RequestMethod.GET)
	public String AdminQnaList(Criteria cri, Model model) {
		QnaDAO qnaDAO = sqlSessionTemplate.getMapper(QnaDAO.class);
		List<QnaVO> qnaList = qnaDAO.qnaList(cri);
		model.addAttribute("qnaList", qnaList);
		PageMaker pageMaker = new PageMaker(cri);
		int totalCount = qnaDAO.getQnaTotalCount(cri);
		pageMaker.setTotalCount(totalCount);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("pageMaker", pageMaker);
		return "/admin/qna/adminQnaList";
	}

}
