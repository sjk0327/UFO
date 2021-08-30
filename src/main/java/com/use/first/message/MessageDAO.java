package com.use.first.message;

import java.util.List;

import org.apache.ibatis.annotations.Param;


import com.use.first.paging.Criteria;




public interface MessageDAO {
	public void sendMessage(MessageVO messageVO);
	public Integer findMessage(int r_id);
	//승빈 추가
	public List<MessageVO> messageByMid(@Param("a_mid") String a_mid);
	public List<MessageVO> messageList(String a_mid, Criteria cri);
	
	public MessageVO messageInfo(int a_id);
	public MessageVO rentInfo(int a_rid);
	public int messageDelete(int a_id);
	public void selectMessageDelete(int a_id);
	public Integer countMessageListTotal(String a_mid, Criteria cri);	
	//승빈
}
