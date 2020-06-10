package com.ssafy.happyhouse.model.dao;

import java.sql.SQLException;
import java.util.List;

import com.ssafy.happyhouse.model.dto.NoticeDto;

public interface NoticeDao {
	public List<NoticeDto> selectAll();
	public void write(NoticeDto dto);
	public NoticeDto detail(String no);
	public void modify(NoticeDto dto);
	public void remove(String no);
}
