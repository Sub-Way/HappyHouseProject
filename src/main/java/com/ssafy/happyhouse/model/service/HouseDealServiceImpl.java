package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dao.HouseDealDao;
import com.ssafy.happyhouse.model.dao.HouseDealDaoImpl;
import com.ssafy.happyhouse.model.dto.HouseDeal;
import com.ssafy.happyhouse.model.dto.PageDTO;

@Service
public class HouseDealServiceImpl implements HouseDealService{
	
	@Autowired
	HouseDealDao dao;

	@Override
	public List<HouseDeal> searchAll(PageDTO pg) throws Exception {
		List<HouseDeal> list = dao.searchAll(pg);
		return list;
	}
	
	@Override
	public List<HouseDeal> searchAptName(PageDTO pg) throws Exception {
		String word = "%"+pg.getWord()+"%";
		pg.setWord(word);
		List<HouseDeal> list = dao.searchAptName(pg);
		return list;
	}
	
	@Override
	public List<HouseDeal> searchDong(PageDTO pg) throws Exception {
		String word = "%"+pg.getWord()+"%";
		pg.setWord(word);
		List<HouseDeal> list = dao.searchDong(pg);
		return list;
	}

	
	@Override
	public HouseDeal show(int no) throws Exception {
		HouseDeal tmp = dao.show(no);
		return tmp;
	}

	@Override
	public int TotalCnt() throws Exception {
		// TODO Auto-generated method stub
		int tmp = dao.TotalCnt();
		return tmp;
	}

	@Override
	public int AptTotalCnt(String word) throws Exception {
		word = "%"+word+"%";
		int tmp = dao.AptTotalCnt(word);
		return tmp;
	}

	@Override
	public int DongTotalCnt(String word) throws Exception {
		word = "%"+word+"%";
		int tmp = dao.DongTotalCnt(word);
		return tmp;
	}

	@Override
	public void hitDong(HouseDeal dto) {
		// TODO Auto-generated method stub
		dao.hits(dto);
	}

	@Override
	public List<HouseDeal> topApt() {
		return dao.topApt();
	}

	@Override
	public List<HouseDeal> topDong() {
		return dao.topDong();
	}
}
