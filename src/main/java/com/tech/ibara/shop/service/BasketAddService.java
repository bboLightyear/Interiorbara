package com.tech.ibara.shop.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

public class BasketAddService extends SqlSessionBase implements ShopService {

	public BasketAddService(SqlSession sqlSession) {
		super(sqlSession);
	}

	@Override
	public void execute(Model model) {
//		HttpServletRequest request = (HttpServletRequest) model.asMap().get("request");
//		ShopDao dao = sqlSession.getMapper(ShopDao.class);
		
		
	}

}
