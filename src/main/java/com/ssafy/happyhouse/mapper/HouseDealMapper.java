package com.ssafy.happyhouse.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ssafy.happyhouse.model.dto.HouseDeal;

@Mapper
public interface HouseDealMapper {
	public List<HouseDeal> select(); 
	public List<HouseDeal> search_apt(String aptName);
	public List<HouseDeal> search_dong(String dongName);
}
