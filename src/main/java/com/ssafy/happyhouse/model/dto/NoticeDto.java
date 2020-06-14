package com.ssafy.happyhouse.model.dto;

public class NoticeDto {
	private String no;
	private String id;
	private String title;
	private String content;
	private String regtime;
	private int hit;
	
	public NoticeDto() {};
	
	public NoticeDto(String no, String id, String title, String content, String regtime) {
		this.no = no;
		this.id = id;
		this.title = title;
		this.content = content;
		this.regtime = regtime;
	}
	
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getRegtime() {
		return regtime;
	}
	
	public void setRegtime(String regtime) {
		this.regtime = regtime;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

}
