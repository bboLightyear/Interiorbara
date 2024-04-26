package com.tech.ibara.main.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.main.dao.MainDao;
import com.tech.ibara.main.dto.OHPreviewDto;

public class OHPreviewService implements MainDataService {
	
	private SqlSession sqlSession;
	
	public OHPreviewService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	
	@Override
	public void execute(Model model) {
		HttpServletRequest request=(HttpServletRequest) model.asMap().get("request");
		MainDao dao=sqlSession.getMapper(MainDao.class);
		
		ArrayList<OHPreviewDto> ohPreviewList=dao.ohPreview();
		
		model.addAttribute("ohPreviewList", ohPreviewList);
	}
}
