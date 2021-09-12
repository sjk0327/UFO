package com.use.first.chatbot;

public class chatMessageVO {
	private String text;
	
	public chatMessageVO() {}
	public chatMessageVO(String text) {
		this.text=text;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	
}
