package com.ssafy.happyhouse.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.model.dao.MemberRepo;
import com.ssafy.happyhouse.model.dto.MemberDto;

@Repository
public class MemberRepoImpl implements MemberRepo{

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public MemberDto login(MemberDto dto) {
		return sqlSession.selectOne("MemberMapper.login", dto);
	}

	@Override
	public int join(MemberDto dto) {
		int successCnt = sqlSession.insert("MemberMapper.join", dto);
		return successCnt;
	}

	@Override
	public void update(MemberDto dto) {
		sqlSession.update("MemberMapper.update",dto);
	}

	@Override
	public void delete(MemberDto dto) {
		sqlSession.delete("MemberMapper.delete",dto);
	}

	@Override
	public MemberDto find(MemberDto dto) {
		return sqlSession.selectOne("MemberMapper.find",dto);
	}
}