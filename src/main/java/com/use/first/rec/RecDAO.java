package com.use.first.rec;

import java.util.List;

import com.use.first.paging.Criteria;

public interface RecDAO {
	
	public List<RecVO> recList(Criteria cri);
	public int getRecTotalCount(Criteria cri);
	public void recUpdate(int v_id, String content);
	
	//고객 내정보에서 내 추천글리스트
			public List<RecVO> memberRecList(Criteria cri,String v_mid);
			public int memberRecTotalCount(Criteria cri,String v_mid);
			//한 개의 추천글
			public RecVO memberOneRecommend(int v_id);
			//추천글 삭제
			public int memberRecommenDelete(int v_id);
			//리뷰 수정
			public int memberRecommenUpdate(RecVO recVO);
		}