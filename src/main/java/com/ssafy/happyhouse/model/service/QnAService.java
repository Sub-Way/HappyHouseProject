package com.ssafy.happyhouse.model.service;

import java.util.List;

import com.ssafy.happyhouse.model.dto.QnA;

public interface QnAService {
	List<QnA> retrieveQnA();
	public QnA detailQnA(int no);
	public boolean writeBoard(QnA qna);
	public boolean modQnA(QnA qna);
	public boolean deleteQnA(int no);
	public boolean replyQnA(QnA qna);
}
