package com.tech.ibara.shop.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.shop.dao.ShopDao;
import com.tech.ibara.shop.dto.BasketDto;

public class BasketAddService extends SqlSessionBase implements ShopService {

	public BasketAddService(SqlSession sqlSession) {
		super(sqlSession);
	}

	@Override
	public void execute(Model model) {
		HttpServletRequest request = (HttpServletRequest) model.asMap().get("request");
		HttpSession session = (HttpSession) model.asMap().get("session");
		ShopDao dao = sqlSession.getMapper(ShopDao.class);
		
		int user_id = (Integer) session.getAttribute("user_id");
		String[] data = request.getParameterValues("selectedCard");
		
		
		BasketDto basketDto = new BasketDto(
				Integer.parseInt(request.getParameter("user_id")),
				Integer.parseInt(request.getParameter("product_id")),
				Integer.parseInt(request.getParameter("option_id")),
				Integer.parseInt(request.getParameter("quantity")));
		
		dao.insertBasket(basketDto);
	}

}
