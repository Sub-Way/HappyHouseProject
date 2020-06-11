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
		aptName = "%"+aptName+"%";
		System.out.println(aptName);
		List<HouseDeal> list = dao.searchAptName(aptName);
		return list;
	}

	@Override
	public List<HouseDeal> searchDong(String dongName) throws Exception {
		dongName = "%"+dongName+"%";
		System.out.println(dongName);
		List<HouseDeal> list = dao.searchDong(dongName);
		return list;
	}

	@Override
	public HouseDeal show(int no) throws Exception {
		HouseDeal tmp = dao.show(no);
		return tmp;
	}

	@Override
	public int getTotalCount(String key, String word) throws Exception {
		word = "%"+word+"%";
		int tmp = dao.getTotalCount(key, word);
		return tmp;
	}

//	@Override
//	public String[] location(String aptname) throws Exception {
//		// TODO Auto-generated method stub
//		return null;
//	}
	
}
