package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.happyhouse.model.dto.NoticeDto;

public interface NoticeService {
	public List<NoticeDto> findAll();
	public void write(NoticeDto dto);
	public NoticeDto detail(String no);
	public void modify(NoticeDto dto);
	public void remove(String no);
}
