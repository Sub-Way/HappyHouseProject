package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dto.HouseDeal;
import com.ssafy.happyhouse.model.dto.PageDTO;
@Service
public interface HouseDealService {
	
	public List<HouseDeal> searchAll(PageDTO pg) throws Exception;
	
	public List<HouseDeal> searchAptName(PageDTO pg) throws Exception;

	public List<HouseDeal> searchDong(PageDTO pg) throws Exception;
	
	public HouseDeal show(int no) throws Exception;
	
	public int TotalCnt() throws Exception;
	
	public int AptTotalCnt(String word) throws Exception;
	
	public int DongTotalCnt(String word) throws Exception;
	
	public void hitDong(HouseDeal dto); //조회수 업데이트
	
	public List<HouseDeal> topApt();
	
	public List<HouseDeal> topDong();
}
