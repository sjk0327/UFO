package com.use.first.message;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface MessageDAO {
	public void sendMessage(@Param("r_id") int r_id, @Param("r_mid") String r_mid);
	public Integer findMessage(int r_id);
}
