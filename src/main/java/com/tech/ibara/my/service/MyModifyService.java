package com.tech.ibara.my.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

public class MyModifyService implements VService{
	private SqlSession sqlSession;
	public MyModifyService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}

	@Override
	public void execute(Model model) {
		System.out.println("MyModifyService()");
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");


		
	}
	

}
