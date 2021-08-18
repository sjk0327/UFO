package com.use.first.rec;

import java.util.List;

import com.use.first.paging.Criteria;

public interface RecDAO {
	
	public List<RecVO> recList(Criteria cri);
	public int getRecTotalCount(Criteria cri);
	public void recUpdate(int v_id, String content);

}
