package com.ssafy.happyhouse.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.model.dto.*;

@Repository
public class HouseDealDaoImpl implements HouseDealDao{
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<HouseDeal> searchAll() throws Exception {
		List<HouseDeal> list = sqlSession.selectList("com.ssafy.happyhouse.model.mapper.HouseDealMapper.select");
		return list;
	}

	@Override
	public List<HouseDeal> searchAptName(String aptName) throws Exception {
		// TODO Auto-generated method stub
		List<HouseDeal> list = sqlSession.selectList("com.ssafy.happyhouse.model.mapper.HouseDealMapper.search_apt", aptName);
		return list;
	}

	@Override
	public List<HouseDeal> searchDong(String dongName) throws Exception {
		// TODO Auto-generated method stub
		List<HouseDeal> list = sqlSession.selectList("com.ssafy.happyhouse.model.mapper.HouseDealMapper.search_dong", dongName);
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
