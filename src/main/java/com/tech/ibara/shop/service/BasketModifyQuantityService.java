package com.tech.ibara.shop.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.shop.dao.ShopDao;

public class BasketModifyQuantityService extends SqlSessionBase implements ShopRestService<Integer> {

	private int modifiedQuantity;
	
	public BasketModifyQuantityService(SqlSession sqlSession) {
		super(sqlSession);
	}

	@Override
	public void execute(Model model) {
		HttpServletRequest request = (HttpServletRequest) model.asMap().get("request");
		HttpSession session = (HttpSession) model.asMap().get("session");
		ShopDao dao = sqlSession.getMapper(ShopDao.class);
		
		int userId = Integer.parseInt((String) session.getAttribute("userId"));
		int optionId = Integer.parseInt(request.getParameter("optionId"));
		String action = request.getParameter("action");
		
		dao.updateBasketQuantity(userId, optionId, action);
		modifiedQuantity = dao.selectBasketQuantity(userId, optionId);
	}

	@Override
	public Integer getData() {
		return modifiedQuantity;
	}
}
