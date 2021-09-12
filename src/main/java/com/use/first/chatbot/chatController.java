package com.use.first.chatbot;

import java.util.Enumeration;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpRequest;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.util.JSONPObject;

@RestController
public class chatController {
	
	
	
	@RequestMapping(value="/chat",method = RequestMethod.POST)
	public chatMessageVO keyboard(@RequestBody chatVO res) {
		chatMessageVO chat;
		if(res.getContent().equals("카메라")) {
			chat=new chatMessageVO("카메라");
		}else{
			chat=new chatMessageVO("그 외");
		}
	
return chat;
}
}
