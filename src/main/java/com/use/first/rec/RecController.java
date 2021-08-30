package com.use.first.rec;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.use.first.member.UserInfoVO;
import com.use.first.paging.Criteria;
import com.use.first.paging.PageMaker;
import com.use.first.product.ProductDAO;
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
	/*
	@RequestMapping(value = "/member/rec/recommendList", method = RequestMethod.GET)
	public String getMemberRecommendList(Model model, Criteria cri,HttpSession session) {
		UserInfoVO userInfo = (UserInfoVO) session.getAttribute("userInfo");
		String userId=userInfo.getM_id();	
		String v_mid = userId;
		RecDAO recDAO = sqlSessionTemplate.getMapper(RecDAO.class);
		List<RecVO> recommendList = recDAO.memberRecList(cri,v_mid);
		model.addAttribute("recommendList", recommendList);
		PageMaker pageMaker = new PageMaker(cri);
		int totalCount = recDAO.memberRecTotalCount(cri,v_mid);
		pageMaker.setTotalCount(totalCount);
		model.addAttribute("pageMaker", pageMaker);
		return "/member/review/memberRecommendList";
	}
	*/
	// 회원에서 내 리뷰
			@RequestMapping(value = "/member/rec/recommendList", method = RequestMethod.GET)
			public String memberRecList(Criteria cri, Model model, HttpSession session) {
				RecDAO recDAO = sqlSessionTemplate.getMapper(RecDAO.class);
				UserInfoVO userInfo = (UserInfoVO) session.getAttribute("userInfo");
				String userId=userInfo.getM_id();	
				
				
				List<RecVO> recommendList = recDAO.memberRecList(cri,userId);
				model.addAttribute("recommendList", recommendList);
				PageMaker pageMaker = new PageMaker(cri);
				int totalCount = recDAO.memberRecTotalCount(cri,userId);
				pageMaker.setTotalCount(totalCount);
				model.addAttribute("pageMaker", pageMaker);

				
				
				return "/member/review/memberRecommendList";
			}
			// 회원에서 내 리뷰 검색어 왔을 때?
			@RequestMapping(value = "/member/rec/recommendList", method = RequestMethod.POST)
			public String memberRecListSearch(Criteria cri, Model model, HttpSession session) {
				RecDAO recDAO = sqlSessionTemplate.getMapper(RecDAO.class);
				UserInfoVO userInfo = (UserInfoVO) session.getAttribute("userInfo");
				String userId=userInfo.getM_id();	


				List<RecVO> recommendList = recDAO.memberRecList(cri,userId);
				model.addAttribute("recommendList", recommendList);
				PageMaker pageMaker = new PageMaker(cri);
				int totalCount = recDAO.memberRecTotalCount(cri,userId);
				pageMaker.setTotalCount(totalCount);
				model.addAttribute("pageMaker", pageMaker);
				return "/member/review/memberRecommendList";
			}
			 //edit창으로 이동
			  @RequestMapping(value = "/member/rec/UpdateForm/{v_id}", method = RequestMethod.GET)
				public String memberRecEdit(@PathVariable int v_id, Model model) {	
				  	RecDAO recDAO = sqlSessionTemplate.getMapper(RecDAO.class);
				  	RecVO oneRecommend = recDAO.memberOneRecommend(v_id);
				  	
					model.addAttribute("oneRecommend", oneRecommend);
					return "/member/review/memberRecommendUpdateForm";
				}
			//추천글 업데이트
			  @RequestMapping(value = "/member/rec/recommendUpdate", method = RequestMethod.POST)
				public String reviewUpdate(@ModelAttribute RecVO recVO) {
					RecDAO recDAO = sqlSessionTemplate.getMapper(RecDAO.class);	
					int n = recDAO.memberRecommenUpdate(recVO);
					if (n == 0) {
						System.out.println("등록 실패");
					}
					return "redirect:/member/rec/recommendList";
				}
			//추천글 삭제 
			  @RequestMapping(value = "/member/rec/recommendDelete/{v_id}", method = RequestMethod.GET)
				public String reviewDelete(@PathVariable int v_id) {
					RecDAO recDAO = sqlSessionTemplate.getMapper(RecDAO.class);	
					int n = recDAO.memberRecommenDelete(v_id);
					if (n == 0) {
						System.out.println("등록 실패");
					}
					return "redirect:/member/rec/recommendList";
				}
			 

		}
