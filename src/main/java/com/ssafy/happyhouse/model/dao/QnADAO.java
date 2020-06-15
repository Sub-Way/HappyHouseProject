package com.ssafy.happyhouse.model.dao;

import java.util.List;
import com.ssafy.happyhouse.model.dto.QnA;

public interface QnADAO {
	List<QnA> selectQnA();
	public QnA selectQnAByNo(int qnaNo);
	public int insertQnA(QnA qna);
	public int updateQnA(QnA qna);
	public int deleteQnA(int no);
	public int replyQnA(QnA qna);
}
