package com.ssafy.happyhouse.model.service;

import java.util.List;

import com.ssafy.happyhouse.model.dto.NoticeDto;

public interface NoticeService {
	public List<NoticeDto> findAll();
	public void write(NoticeDto dto);
	public NoticeDto detail(String no);
	public void modify(NoticeDto dto);
	public void hits(NoticeDto dto); //조회수 업데이트
	public void remove(String no);
}
