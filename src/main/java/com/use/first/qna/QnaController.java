package com.use.first.qna;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.use.first.paging.Criteria;
import com.use.first.paging.PageMaker;

@Controller
public class QnaController {
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@RequestMapping(value = "/member/qna/qnaList", method = RequestMethod.GET)
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

	@RequestMapping(value = "/member/qna/qnaDetail/{q_id}", method = RequestMethod.GET)
	public String memberQnaDetail(Model model, @PathVariable int q_id) {
		QnaDAO qnaDAO = sqlSessionTemplate.getMapper(QnaDAO.class);
		QnaVO qnaVO = qnaDAO.qnaInfo(q_id);
		qnaVO.setQ_readCount(qnaVO.getQ_readCount() + 1);
		qnaDAO.qnaRead(q_id, qnaVO.getQ_readCount());
		model.addAttribute("qnaVO", qnaVO);
		return "/member/qna/memberQnaDetail";
	}
	
	@RequestMapping(value = "/member/qna/qnaEdit/{q_id}", method = RequestMethod.GET)
	public String memberQnaEdit(Model model, @PathVariable int q_id, @RequestParam QnaVO qna) {
		model.addAttribute("qnaVO", qna);
		return "/member/qna/memberQnaEditForm";
	}
	
	@RequestMapping(value = "/member/qna/qnaUpdate/{q_id}", method = RequestMethod.POST)
	public String memberQnaUpdate(Model model, @PathVariable int q_id, @RequestParam QnaVO qna) {
		QnaDAO qnaDAO = sqlSessionTemplate.getMapper(QnaDAO.class);
		int result = qnaDAO.qnaUpdate(qna);
		return "redirecet:/member/qna/qnaDetail/" + q_id;
	}
	
	@RequestMapping(value = "/member/qna/qnaDelete/{q_id}", method = RequestMethod.GET)
	public String memberQnaDelete(Model model, @PathVariable int q_id) {
		QnaDAO qnaDAO = sqlSessionTemplate.getMapper(QnaDAO.class);
		int result = qnaDAO.qnaDelete(q_id);
		return "redirect:/member/qna/qnaList";
	}
}
