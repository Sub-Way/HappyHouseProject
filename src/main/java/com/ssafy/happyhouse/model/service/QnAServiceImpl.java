package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.happyhouse.model.dao.QnADAO;
import com.ssafy.happyhouse.model.dto.QnA;

@Service
public class QnAServiceImpl implements QnAService{
	
	@Autowired
	private QnADAO dao;
	
	@Override
	public List<QnA> retrieveQnA() {
		return dao.selectQnA();
	}

	@Override
	@Transactional
	public QnA detailQnA(int no) {
		// TODO Auto-generated method stub
		QnA tmp = dao.selectQnAByNo(no);
		System.out.println("답변자: " + tmp.getReplyUserid());
		System.out.println("질문자: " + tmp.getQnaUserid());
		return tmp;
	}
	
	@Override
	public boolean writeBoard(QnA qna) {
		// TODO Auto-generated method stub
		return dao.insertQnA(qna) == 1;
 	}

	@Override
	public boolean modQnA(QnA qna) {
		// TODO Auto-generated method stub
		return dao.updateQnA(qna) == 1;
	}
	
	@Override
	@Transactional
	public boolean deleteQnA(int no) {
		return dao.deleteQnA(no) == 1;
	}

	@Override
	public boolean replyQnA(QnA qna) {
		// TODO Auto-generated method stub
		return dao.replyQnA(qna) == 1;
	}


}
