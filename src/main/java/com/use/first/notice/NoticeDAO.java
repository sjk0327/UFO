package com.use.first.notice;

import java.util.List;

import com.use.first.paging.Criteria;

public interface NoticeDAO {
	
	public List<NoticeVO> noticeList(Criteria cri);
	public int getNoticeTotalCount(Criteria cri);
	public NoticeVO noticeInfo(int n_id);
	public int noticeUpdate(NoticeVO noticeVO);
	public int noticeInsert(NoticeVO noticeVO);
	public int noticeDelete(int n_id);

}
