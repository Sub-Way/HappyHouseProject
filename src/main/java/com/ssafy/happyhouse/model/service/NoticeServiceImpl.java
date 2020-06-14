package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dao.NoticeDao;
import com.ssafy.happyhouse.model.dto.NoticeDto;

@Service
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	NoticeDao dao;

	@Override
	public List<NoticeDto> findAll() {
		return dao.selectAll();
	}

	@Override
	public void write(NoticeDto dto) {
		dao.write(dto);
	}

	@Override
	public NoticeDto detail(String no) {
		return dao.detail(no);
	}

	@Override
	public void modify(NoticeDto dto) {
		dao.modify(dto);
	}

	@Override
	public void remove(String no) {
		dao.remove(no);
	}
//
//	@Override
//	public NoticeDto getInfo(int no) {
//		// TODO Auto-generated method stub
//		return null;
//	}
//	

	@Override
	public void hits(NoticeDto dto) {
		dao.hits(dto);
	}
	
}
