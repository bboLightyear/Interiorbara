package com.tech.ibara.main.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.main.dao.MainSearchDao;
import com.tech.ibara.main.dto.BizSearchDto;

public class BizSearchService implements MainSearchService {
	
	private SqlSession sqlSession;

	public BizSearchService(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		MainSearchDao dao = sqlSession.getMapper(MainSearchDao.class);
		
		String mainSearchContent = request.getParameter("mainSearchContent");
		if(mainSearchContent == null || mainSearchContent.equals("/")) {
			mainSearchContent = "";
		}
		ArrayList<BizSearchDto> bizSearchList = dao.bizSearchContent(mainSearchContent);
		model.addAttribute("bizSearchList", bizSearchList);
		
	}
}
