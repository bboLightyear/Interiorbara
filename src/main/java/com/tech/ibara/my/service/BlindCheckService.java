package com.tech.ibara.my.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.my.dao.MyDao;

public class BlindCheckService implements VService{
	private SqlSession sqlSession;
	public BlindCheckService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	@Override
	public void execute(Model model) {
		Map<String, Object> map= model.asMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		String reno=request.getParameter("reno");
		MyDao mdao=sqlSession.getMapper(MyDao.class);
		String yesno=mdao.yesnoCheck_Report(reno);
		if(yesno.equals("N")) {// Y로 바꿔주고 원글은 블라인드처리하기
			
		}else {//N로 바꿔주고 원글 살리기 
			
		}

		
	}
	

}
