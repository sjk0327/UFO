package com.use.first.qna;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	@RequestMapping(value = "/member/qna/qnaList", method = RequestMethod.POST)
	public String memberQnaListSearch(Criteria cri, Model model) {
		QnaDAO qnaDAO = sqlSessionTemplate.getMapper(QnaDAO.class);
		String[] keyW = cri.getKeyword().split(",");
		if(keyW.length > 0) {
			if(cri.getSearchType().equals("c"))
				cri.setKeyword(keyW[0]);
			else
				cri.setKeyword(keyW[1]);
		}
		
		List<QnaVO> qnaList = qnaDAO.qnaList(cri);
		model.addAttribute("qnaList", qnaList);
		PageMaker pageMaker = new PageMaker(cri);
		int totalCount = qnaDAO.getQnaTotalCount(cri);
		pageMaker.setTotalCount(totalCount);
		System.out.println("memberQnaListSearch :: criteria : " + cri.toString());
		System.out.println("memberQnaListSearch :: pageMaker : " + pageMaker.toString());
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
	public String memberQnaEdit(Model model, @PathVariable int q_id) {
		QnaDAO qnaDAO = sqlSessionTemplate.getMapper(QnaDAO.class);
		QnaVO qnaVO = qnaDAO.qnaInfo(q_id);
		model.addAttribute("qnaVO", qnaVO);
		return "/member/qna/memberQnaEditForm";
	}
	
	@RequestMapping(value = "/member/qna/qnaUpdate/{q_id}", method = RequestMethod.POST)
	public String memberQnaUpdate(Model model, @PathVariable int q_id, QnaVO qna) {
		QnaDAO qnaDAO = sqlSessionTemplate.getMapper(QnaDAO.class);
		System.out.println("memberQnaUpdate :: qna : " + qna.toString());
		int result = qnaDAO.qnaUpdate(qna);
		return "redirect:/member/qna/qnaDetail/" + q_id;
	}
	
	@RequestMapping(value = "/member/qna/qnaDelete/{q_id}", method = RequestMethod.GET)
	public String memberQnaDelete(Model model, @PathVariable int q_id) {
		QnaDAO qnaDAO = sqlSessionTemplate.getMapper(QnaDAO.class);
		int result = qnaDAO.qnaDelete(q_id);
		return "redirect:/member/qna/qnaList";
	}
	
	@RequestMapping(value = "/member/qna/qnaWrite", method = RequestMethod.GET)
	public String memberQnaWriteFrom(Model model) {
		QnaDAO qnaDAO = sqlSessionTemplate.getMapper(QnaDAO.class);
		
		//qna 의 마지막 칼럼의 q_id 값을 넘겨주기
		int lastIndex = qnaDAO.qnaLastIndex() + 1;
		model.addAttribute("lastIndex", lastIndex);
		return "/member/qna/memberQnaWriteForm";
	}
	
	@RequestMapping(value = "/member/qna/qnaWrite", method = RequestMethod.POST)
	public String memberQnaWritePro(Model model, QnaVO qna) {
		QnaDAO qnaDAO = sqlSessionTemplate.getMapper(QnaDAO.class);
		
		System.out.println("memberQnaWritePro :: qna : " + qna.toString());
		int result = qnaDAO.qnaInsert(qna);
		List<QnaVO> qnaList = qnaDAO.qnaSearchById(qna.getQ_mid());
		int ref = qnaList.get(qnaList.size()-1).getQ_id();
		qnaDAO.qnaUpdateRef(ref);
		return "redirect:/member/qna/qnaList";
	}
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value = "/admin/qnaList", method = RequestMethod.GET)
	public String AdminQnaList(Criteria cri, Model model) {
		QnaDAO qnaDAO = sqlSessionTemplate.getMapper(QnaDAO.class);
		List<QnaVO> qnaList = qnaDAO.adminQnaList(cri);
		model.addAttribute("qnaList", qnaList);
		List<QnaVO> qnaAnswer = qnaDAO.adminQnaAnswer(cri);
		model.addAttribute("qnaAnswer", qnaAnswer);
		PageMaker pageMaker = new PageMaker(cri);
		int totalCount = qnaDAO.getQnaTotalCount(cri);
		pageMaker.setTotalCount(totalCount);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("pageMaker", pageMaker);
		return "/admin/qna/adminQnaList";
	}
	
	@RequestMapping(value = "/admin/qnaInsert", method = RequestMethod.POST)
	public String adminQnaInsert(QnaVO qnaVO, Model model) {
		QnaDAO qnaDAO = sqlSessionTemplate.getMapper(QnaDAO.class);
		int n = qnaDAO.adminQnaInsert(qnaVO);
		if (n != 1) {
			System.out.println("qna Insert 실패 :: " + qnaVO.toString());
		}
		qnaDAO.adminQnaUpdate(qnaVO.getQ_answer(), qnaVO.getQ_reference());
		return "redirect:/admin/qnaList";
	}
	
	@RequestMapping(value = "/admin/qnaUpdate", method = RequestMethod.POST)
	public String adminQnaUpdate(QnaVO qnaVO, Model model) {
		QnaDAO qnaDAO = sqlSessionTemplate.getMapper(QnaDAO.class);
		int n = qnaDAO.adminAnswerUpdate(qnaVO);
		if (n != 1) {
			System.out.println("수정 실패  :: " + qnaVO.toString());
		}
		return "redirect:/admin/qnaList";
	}
	
	@RequestMapping(value = "/admin/qnaDelete", method = RequestMethod.POST)
	public String adminQnaDelete(QnaVO qnaVO, Model model) {
		QnaDAO qnaDAO = sqlSessionTemplate.getMapper(QnaDAO.class);
		qnaDAO.adminQnaUpdate(qnaVO.getQ_answer(), qnaVO.getQ_reference());
		int n = qnaDAO.adminAnswerDelete(qnaVO);
		if (n != 1) {
			System.out.println("삭제 실패  :: " + qnaVO.toString());
		}
		return "redirect:/admin/qnaList";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
