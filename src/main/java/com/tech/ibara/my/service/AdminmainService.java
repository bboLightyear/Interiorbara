package com.tech.ibara.my.service;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.ui.Model;

import com.tech.ibara.my.dao.MyDao;

public class AdminmainService implements VService {
	private SqlSession sqlSession;

	public AdminmainService(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void execute(Model model) {
		MyDao mdao=sqlSession.getMapper(MyDao.class);
	}
		
		
		
	
}
