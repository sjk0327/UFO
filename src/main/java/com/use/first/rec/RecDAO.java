package com.use.first.rec;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.use.first.paging.Criteria;

public interface RecDAO {
	
	public List<RecVO> recList(Criteria cri);
	public int getRecTotalCount(Criteria cri);
	public void recUpdate(int v_id, String content);
	
	//고객 내정보에서 내 리뷰리스트
	public List<RecVO> memberRecList(Criteria cri,String v_mid);
	public int memberRecTotalCount(Criteria cri,String v_mid);

}
