package com.ssafy.happyhouse.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.model.dto.NoticeDto;

@Repository
public class NoticeDaoImpl implements NoticeDao {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<NoticeDto> selectAll() {
		return sqlSession.selectList("NoticeMapper.selectAll");
	}

	@Override
	public void write(NoticeDto dto) {
		sqlSession.insert("NoticeMapper.write", dto);
	}

	@Override
	public NoticeDto detail(String no) {
		return sqlSession.selectOne("NoticeMapper.detail",no);
	}

	@Override
	public void modify(NoticeDto dto) {
		sqlSession.update("NoticeMapper.update",dto);
	}

	@Override
	public void remove(String no) {
		sqlSession.delete("NoticeMapper.delete", no);
	}
}
