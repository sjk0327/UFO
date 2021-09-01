package com.use.first.qna;

import java.util.List;

import com.use.first.paging.Criteria;

public interface QnaDAO {

	public List<QnaVO> qnaList(Criteria cri);
	public int getQnaTotalCount(Criteria cri);
}
