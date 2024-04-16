package com.tech.ibara.my.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.my.dao.MyDao;

public class SellerSaleService implements VService{
	private SqlSession sqlSession;
	public SellerSaleService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	@Override
	public void execute(Model model) {
		MyDao mdao=sqlSession.getMapper(MyDao.class);
		
		
	}
	

}
