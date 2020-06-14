package com.ssafy.happyhouse.model.dto;

public class PageDTO {
	private String key;
	private String word;
	private String reqPageNo;
	private int startNo;
	
	@Override
	public String toString() {
		return "PageDTO [key=" + key + ", startNo=" + startNo + ", word=" + word + "]";
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getWord() {
		return word;
	}
	public void setWord(String word) {
		this.word = word;
	}
	public int getStartNo() {
		return startNo;
	}
	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}
	public String getReqPageNo() {
		return reqPageNo;
	}
	public void setReqPageNo(String reqPageNo) {
		this.reqPageNo = reqPageNo;
	}
	
	
}
