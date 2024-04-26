package com.tech.ibara.main.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.main.dao.MainDao;
import com.tech.ibara.main.dto.QnAPreviewDto;

public class QnAPreviewService implements MainDataService{
	
	private SqlSession sqlSession;
	
	public QnAPreviewService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}

	@Override
	public void execute(Model model) {
		HttpServletRequest request=(HttpServletRequest) model.asMap().get("request");
		MainDao dao=sqlSession.getMapper(MainDao.class);
		
		ArrayList<QnAPreviewDto> qnaPreviewList=dao.qnaPreview();
		
		model.addAttribute("qnaPreviewList", qnaPreviewList);	
	}

}
