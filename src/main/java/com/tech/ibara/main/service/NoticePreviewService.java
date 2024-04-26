package com.tech.ibara.main.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.main.dao.MainDao;
import com.tech.ibara.main.dto.NoticePreviewDto;

public class NoticePreviewService implements MainDataService {
	
	private SqlSession sqlSession;
	
	public NoticePreviewService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}

	@Override
	public void execute(Model model) {
		HttpServletRequest request=(HttpServletRequest) model.asMap().get("request");
		MainDao dao=sqlSession.getMapper(MainDao.class);
		
		ArrayList<NoticePreviewDto> noticePreviewList=dao.noticePreview();
		
		model.addAttribute("noticePreviewList", noticePreviewList);	
	}

}
