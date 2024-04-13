package com.tech.ibara.my.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.my.dao.MyDao;
import com.tech.ibara.my.dto.MyReportDto;

public class ReportService implements VService{
	private SqlSession sqlSession;
	public ReportService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}

	@Override
	public void execute(Model model) {
//		Map<String, Object> map= model.asMap();
//		HttpServletRequest request=(HttpServletRequest) map.get("request");
		MyDao mdao=sqlSession.getMapper(MyDao.class);
		ArrayList<MyReportDto> list=mdao.getReportList();
		model.addAttribute("list",list);		
	}
}
