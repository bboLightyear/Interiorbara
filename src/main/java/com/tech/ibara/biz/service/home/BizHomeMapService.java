 package com.tech.ibara.biz.service.home;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.tech.ibara.biz.dao.BizIDao;
import com.tech.ibara.biz.dto.BizHomeDto;
import com.tech.ibara.biz.service.BizServiceInter;

@Service
public class BizHomeMapService implements BizServiceInter {

	private SqlSession sqlSession;

	public BizHomeMapService(SqlSession sqlSession) {
		// TODO Auto-generated constructor stub
		this.sqlSession=sqlSession;
	}

	@Override
	public void execute(Model model) {

		System.out.println("service BizHomeMapService>>>");
		
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		BizIDao dao=sqlSession.getMapper(BizIDao.class);
		
		String inteno=request.getParameter("inteno");
		
		model.addAttribute("inteno", inteno);
		
		
//		상단의 업체정보에 들어갈 내용(업체명, 대표사진, 업체주소, 전문시공영역, 공지내용, 업체정보넘버)을 불러오는 함수
		BizHomeDto bizHome = dao.bizHome(inteno);
		model.addAttribute("bizHome", bizHome);
		
		
	}

}
