package com.ssafy.happyhouse.model.dao;

import java.util.List;

//import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.model.dto.HouseDeal;
import com.ssafy.happyhouse.model.dto.PageDTO;
//@Mapper
public interface HouseDealDao {

	public List<HouseDeal> searchAll(PageDTO pg) throws Exception;
	
	public List<HouseDeal> searchAptName(PageDTO pg) throws Exception;

	public List<HouseDeal> searchDong(PageDTO pg) throws Exception;
	
	public HouseDeal show(int no) throws Exception;
	
	public int TotalCnt() throws Exception;
	
	public int AptTotalCnt(String word) throws Exception;
	
	public int DongTotalCnt(String word) throws Exception;
	
	public void hits(HouseDeal dto); //조회수 업데이트
	
}
