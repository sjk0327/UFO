package com.use.first.message;

import java.util.List;

import org.apache.ibatis.annotations.Param;


import com.use.first.paging.Criteria;




public interface MessageDAO {
	public void sendMessage(@Param("r_id") int r_id, @Param("r_mid") String r_mid);
	public Integer findMessage(int r_id);
	//승빈 추가
	public List<MessageVO> messageByMid(@Param("a_mid") String a_mid);
	public List<MessageVO> messageList(@Param("a_mid") String a_mid, Criteria cri);
	public MessageVO messageInfo(@Param("a_mid") String a_mid);
	public MessageVO messageInfo2(int aId);
	public int countMessageListTotal(@Param("a_mid") String a_mid, Criteria cri);	
	//승빈
}
