package com.use.first.notice;

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
import com.use.first.product.ProductDAO;
import com.use.first.product.ProductVO;
import com.use.first.rec.RecDAO;
import com.use.first.rec.RecVO;

@Controller
public class NoticeController {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@RequestMapping(value = "/admin/noticeList", method = RequestMethod.GET)
	public String adminNoticeList(Criteria cri, Model model) {
		NoticeDAO noticeDAO = sqlSessionTemplate.getMapper(NoticeDAO.class);
		List<NoticeVO> noticeList = noticeDAO.noticeList(cri);
		model.addAttribute("noticeList", noticeList);
		PageMaker pageMaker = new PageMaker(cri);
		int totalCount = noticeDAO.getNoticeTotalCount(cri);
		pageMaker.setTotalCount(totalCount);
		model.addAttribute("pageMaker", pageMaker);
		return "/admin/notice/adminNoticeList";
	}
	
	@RequestMapping(value = "/admin/noticeDetail/{n_id}", method = RequestMethod.GET)
	public String adminNoticeDetail(Model model, @PathVariable int n_id) {
		NoticeDAO noticeDAO = sqlSessionTemplate.getMapper(NoticeDAO.class);
		NoticeVO noticeVO = noticeDAO.noticeInfo(n_id);
		model.addAttribute("noticeVO", noticeVO);
		return "/admin/notice/adminNoticeDetail";
	}
	
	@RequestMapping(value = "/admin/notice/noticeUpdate", method = RequestMethod.POST)
	public String adminNoticeUpdate(NoticeVO noticeVO, Model model) {
		NoticeDAO noticeDAO = sqlSessionTemplate.getMapper(NoticeDAO.class);
		int n = noticeDAO.noticeUpdate(noticeVO);
		if (n != 1) {
			System.out.println("Notice 수정 실패  :: " + noticeVO.toString());
		}
		return "redirect:/admin/noticeList";
	}
	
	@RequestMapping(value = "/admin/notice/noticeInsert", method = RequestMethod.POST)
	public String adminNoticeInsert(NoticeVO noticeVO, Model model) {
		NoticeDAO noticeDAO = sqlSessionTemplate.getMapper(NoticeDAO.class);
		int n = noticeDAO.noticeInsert(noticeVO);
		if (n != 1) {
			System.out.println("Notice Insert 실패 :: " + noticeVO.toString());
		}
		return "redirect:/admin/noticeList";
	}
	
	@RequestMapping(value = "/admin/notice/noticeInsertForm")
	public String adminNoticeInsertForm(Model model) {
		return "/admin/notice/adminNoticeInsert";
	}
	
	@RequestMapping(value = "/admin/noticeDelete/{n_id}", method = RequestMethod.GET)
	public String adminNoticeDelete(Model model, @PathVariable int n_id) {
		NoticeDAO noticeDAO = sqlSessionTemplate.getMapper(NoticeDAO.class);
		
		int n = noticeDAO.noticeDelete(n_id);
		if(n != 1) {
			System.out.println("삭제실패 ");
		}
		return "redirect:/admin/noticeList";
	}
	
	@RequestMapping(value = "/member/noticeList", method = RequestMethod.GET)
	public String MemberNoticeList(Criteria cri, Model model) {
		NoticeDAO noticeDAO = sqlSessionTemplate.getMapper(NoticeDAO.class);

		List<NoticeVO> noticeList = noticeDAO.noticeList(cri);
		model.addAttribute("noticeList", noticeList);
		PageMaker pageMaker = new PageMaker(cri);
		int totalCount = noticeDAO.getNoticeTotalCount(cri);
		pageMaker.setTotalCount(totalCount);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("pageMaker", pageMaker);
		return "/member/notice/memberNoticeList";
	}
	
	@RequestMapping(value = "/member/noticeDetail/{n_id}", method = RequestMethod.GET)
	public String memberNoticeDetail(Model model, @PathVariable int n_id) {
		NoticeDAO noticeDAO = sqlSessionTemplate.getMapper(NoticeDAO.class);
		NoticeVO noticeVO = noticeDAO.noticeInfo(n_id);
		model.addAttribute("noticeVO", noticeVO);
		return "/member/notice/memberNoticeDetail";
	}

}
