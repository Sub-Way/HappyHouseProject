package com.ssafy.happyhouse.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.happyhouse.model.dto.QnA;

@Repository
public class QnADAOImpl implements QnADAO{

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<QnA> selectQnA() {
		return sqlSession.selectList("QnAMapper.selectQnA");
	}

	@Override
	public QnA selectQnAByNo(int qnaNo) {
		return sqlSession.selectOne("QnAMapper.selectQnAByNo",qnaNo);
	}

	@Override
	public int insertQnA(QnA qna) {
		return sqlSession.insert("QnAMapper.insertQnA", qna);
	}

	@Override
	public int updateQnA(QnA qna) {
		return sqlSession.update("QnAMapper.updateQnA",qna);
	}

	@Override
	public int deleteQnA(int no) {
		return sqlSession.delete("QnAMapper.deleteQnA", no);
	}

	@Override
	public int replyQnA(QnA qna) {
		return sqlSession.update("QnAMapper.replyQnA", qna);
	}
	
}
