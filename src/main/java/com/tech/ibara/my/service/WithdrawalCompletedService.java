package com.tech.ibara.my.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.my.dao.MyDao;

public class WithdrawalCompletedService implements VService{
	private SqlSession sqlSession;
	public WithdrawalCompletedService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	@Override
	public void execute(Model model) {
		System.out.println("WithdrawalCompletedService()");
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		String memno=request.getParameter("memno");
		MyDao mdao=sqlSession.getMapper(MyDao.class);
		mdao.completedWithdrawal(memno);
		
	}
	
	

}
