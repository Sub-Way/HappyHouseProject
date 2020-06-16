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
	public List<HouseDeal> searchAll(PageDTO pg) throws Exception {
		System.out.println("찾을 주소 check : "+ pg.getStartNo());
		List<HouseDeal> tmp = sqlSession.selectList("HouseDealMapper.selectAllPage", pg);
		return tmp;
	}
	
	@Override
	public List<HouseDeal> searchAptName(PageDTO pg) throws Exception {
		// TODO Auto-generated method stub
		List<HouseDeal> tmp = sqlSession.selectList("HouseDealMapper.selectAptpage", pg);
		return tmp;
	}

	@Override
	public List<HouseDeal> searchDong(PageDTO pg) throws Exception {
		// TODO Auto-generated method stub
		List<HouseDeal> tmp = sqlSession.selectList("HouseDealMapper.selectDongPage", pg);
		return tmp;
	}


	@Override
	public int TotalCnt() throws Exception {
		//int totalCnt = sqlSession.selectOne("HouseDealMapper.TotalCnt");
		int tmp = sqlSession.selectOne("HouseDealMapper.TotalCnt");
		System.out.println("total count 확인 : "+ tmp);
		return tmp;
	}

	@Override
	public int AptTotalCnt(String word) throws Exception {
		int totalCnt = sqlSession.selectOne("HouseDealMapper.AptTotalCnt", word);
		return totalCnt;
	}

	@Override
	public int DongTotalCnt(String word) throws Exception {
		int totalCnt = sqlSession.selectOne("HouseDealMapper.DongTotalCnt", word);
		return totalCnt;
	}

	@Override
	public HouseDeal show(int no) throws Exception {
		// TODO Auto-generated method stub
		HouseDeal tmp = sqlSession.selectOne("HouseDealMapper.show", no);
		return tmp;
	}

	@Override
	public void hits(HouseDeal dto) {
		sqlSession.update("HouseDealMapper.hits", dto);
	}

	@Override
	public List<HouseDeal> topApt() {
		return sqlSession.selectList("HouseDealMapper.topApt");
	}

	@Override
	public List<HouseDeal> topDong() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("HouseDealMapper.topDong");
	}
}
