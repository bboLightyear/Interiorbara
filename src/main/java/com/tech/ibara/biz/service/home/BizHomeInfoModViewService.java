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
public class BizHomeInfoModViewService implements BizServiceInter {

	private SqlSession sqlSession;

	public BizHomeInfoModViewService(SqlSession sqlSession) {
		// TODO Auto-generated constructor stub
		this.sqlSession=sqlSession;
	}

	@Override
	public void execute(Model model) {

		System.out.println("service BizHomeInfoModViewServices>>>");
		
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		BizIDao dao=sqlSession.getMapper(BizIDao.class);
		
		String inteno=request.getParameter("inteno");
//		실제로는 세션에서 받아온 memno를 써야함
//		String Session_inteno=dao.userIdNoToBizIdNo(inteno);
		
//		if(session_inteno!=inteno) {
//		System.out.println("수정불가알림창으로");
//		}

//		임의로 이 수정기능 사용 가능하게 우선 inteno랑 같은 "3"을 설정해놓음
		String memno="3";
		
		model.addAttribute("inteno", inteno);
		model.addAttribute("memno", memno);
		
//		상단의 업체정보에 들어갈 내용(업체명, 대표사진, 업체주소, 전문시공영역, 공지내용, 업체정보넘버)을 불러오는 함수
		BizHomeDto bizHome = dao.bizHome(inteno);
		model.addAttribute("bizHome", bizHome);	
		
		
		
		
	}
		
}
