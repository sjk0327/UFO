package com.use.first.qna;

import java.util.List;

import com.use.first.paging.Criteria;

public interface QnaDAO {

	public List<QnaVO> qnaList(Criteria cri);
	public List<QnaVO> adminQnaList(Criteria cri);
	public List<QnaVO> adminQnaListY(Criteria cri);
	public List<QnaVO> adminQnaListN(Criteria cri);
	public List<QnaVO> adminQnaAnswer(Criteria cri);
	public int getQnaTotalCount(Criteria cri);
	public int getQnaTotalCount1(Criteria cri);
	public int adminQnaInsert(QnaVO qnaVO);
	public int adminAnswerUpdate(QnaVO qnaVO);
	public int adminAnswerDelete(QnaVO qnaVO);
	public void adminQnaUpdate(boolean q_answer, int q_id);
	public void advertisementDelete(String title, String content, int q_id);
}
