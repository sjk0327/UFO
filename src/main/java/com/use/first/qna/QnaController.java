package com.use.first.qna;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.use.first.notice.NoticeDAO;
import com.use.first.notice.NoticeVO;
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
		List<QnaVO> qnaList = qnaDAO.adminQnaList(cri);
		model.addAttribute("qnaList", qnaList);
		List<QnaVO> qnaAnswer = qnaDAO.adminQnaAnswer(cri);
		model.addAttribute("qnaAnswer", qnaAnswer);
		PageMaker pageMaker = new PageMaker(cri);
		int totalCount = qnaDAO.getQnaTotalCount1(cri);
		pageMaker.setTotalCount(totalCount);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("pageMaker", pageMaker);
		return "/admin/qna/adminQnaList";
	}
	
	@RequestMapping(value = "/admin/qnaList", method = RequestMethod.POST)
	public String AdminQnaListPOST(Criteria cri, Model model) {
		QnaDAO qnaDAO = sqlSessionTemplate.getMapper(QnaDAO.class);
		List<QnaVO> qnaList = qnaDAO.adminQnaList(cri);
		model.addAttribute("qnaList", qnaList);
		List<QnaVO> qnaAnswer = qnaDAO.adminQnaAnswer(cri);
		model.addAttribute("qnaAnswer", qnaAnswer);
		PageMaker pageMaker = new PageMaker(cri);
		int totalCount = qnaDAO.getQnaTotalCount1(cri);
		pageMaker.setTotalCount(totalCount);
		System.out.println(cri.toString());
		System.out.println(pageMaker.toString());
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
	
	@RequestMapping(value = "/admin/advertisementDelete", method = RequestMethod.POST)
	public String advertisementDelete(QnaVO qnaVO, Model model) {
		QnaDAO qnaDAO = sqlSessionTemplate.getMapper(QnaDAO.class);
		String title = "광고글 삭제";
		String content = "관리자에 의해 삭제된 코멘트 입니다.";
		qnaDAO.advertisementDelete(title, content, qnaVO.getQ_id());
		
		return "redirect:/admin/qnaList";
	}

}
