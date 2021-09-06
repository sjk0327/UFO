package com.use.first.qna;

import java.util.List;

import com.use.first.paging.Criteria;

public interface QnaDAO {

	public List<QnaVO> qnaList(Criteria cri);

	public List<QnaVO> adminQnaList(Criteria cri);
	public List<QnaVO> adminQnaAnswer(Criteria cri);
	public int getQnaTotalCount(Criteria cri);
	public int getQnaTotalCount1(Criteria cri);

	public QnaVO qnaInfo(int q_id);
	public int qnaRead(int q_id, int q_readCount);
	public int qnaDelete(int q_id);
	public int qnaUpdate(QnaVO qna);
	public int qnaLastIndex();
	public int qnaInsert(QnaVO qna);
	public List<QnaVO> qnaSearchById(String q_mid);
	public int qnaUpdateRef(int q_reference);
	
	
	
	
	public int adminQnaInsert(QnaVO qnaVO);
	public int adminAnswerUpdate(QnaVO qnaVO);
	public int adminAnswerDelete(QnaVO qnaVO);
	public void adminQnaUpdate(boolean q_answer, int q_id);
	public void advertisementDelete(String title, String content, int q_id);

}
