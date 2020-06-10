package com.ssafy.happyhouse.model.dao;

import java.util.List;

//import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.model.dto.HouseDeal;

//@Mapper
public interface HouseDealDao {
	
	public List<HouseDeal> searchAll() throws Exception;
	
	public List<HouseDeal> searchAptName(String aptName) throws Exception;

	public List<HouseDeal> searchDong(String dongName) throws Exception;
	
//	public HouseDeal show(int no) throws Exception;
//	
//	public int getTotalCount(String key, String word) throws Exception;
//	
//	public String []  location (String aptname) throws Exception;
}
