package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dao.HouseDealDao;
import com.ssafy.happyhouse.model.dao.HouseDealDaoImpl;
import com.ssafy.happyhouse.model.dto.HouseDeal;

@Service
public class HouseDealServiceImpl implements HouseDealService{
	
	@Autowired
	HouseDealDao dao;
	
	@Override
	public List<HouseDeal> searchAll() throws Exception {
		// TODO Auto-generated method stub
		List<HouseDeal> list = dao.searchAll();
		return list;
	}

	@Override
	public List<HouseDeal> searchAptName(String aptName) throws Exception {
		List<HouseDeal> list = dao.searchAptName(aptName);
		return list;
	}

	@Override
	public List<HouseDeal> searchDong(String dongName) throws Exception {
		List<HouseDeal> list = dao.searchDong(dongName);
		return list;
	}

//	@Override
//	public HouseDeal show(int no) throws Exception {
//		// TODO Auto-generated method stub
//		return null;
//	}
//
//	@Override
//	public int getTotalCount(String key, String word) throws Exception {
//		// TODO Auto-generated method stub
//		return 0;
//	}
//
//	@Override
//	public String[] location(String aptname) throws Exception {
//		// TODO Auto-generated method stub
//		return null;
//	}
//	
}
