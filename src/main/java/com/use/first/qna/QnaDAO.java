package com.use.first.qna;

import java.util.List;

import com.use.first.paging.Criteria;

public interface QnaDAO {

	public List<QnaVO> qnaList(Criteria cri);
	public int getQnaTotalCount(Criteria cri);
	public QnaVO qnaInfo(int q_id);
	public int qnaRead(int q_id, int q_readCount);
	public int qnaDelete(int q_id);
	public int qnaUpdate(QnaVO qna);
}
