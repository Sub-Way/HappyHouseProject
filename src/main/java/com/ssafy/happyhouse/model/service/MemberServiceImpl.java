package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dao.*;
import com.ssafy.happyhouse.model.dto.MemberDto;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	MemberRepo dao;
	
	@Override
	public MemberDto login(MemberDto dto) {
		return dao.login(dto);
	}

	public int loginCheck(MemberDto dto) {
		int successCnt = dao.loginCheck(dto);
		return successCnt;
	}
	
	@Override
	public int join(MemberDto dto) {
		int successCnt = dao.join(dto);
		return successCnt;
	}

	@Override
	public void update(MemberDto dto) {
		System.out.println(dto.getId());
		System.out.println(dto.getName());
		dao.update(dto);
	}

	@Override
	public void delete(MemberDto dto) {
		dao.delete(dto);
	}
	
	@Override
	public MemberDto find(MemberDto dto) {
		return dao.find(dto);
	}

}
