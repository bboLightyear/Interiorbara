package com.tech.ibara.shop.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.shop.dao.ShopDao;
import com.tech.ibara.shop.dto.BasketDto;
import com.tech.ibara.shop.dto.ProductDto;

public class BasketViewService implements ShopService {

	private SqlSession sqlSession;
	
	public BasketViewService(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public void execute(Model model) {
		HttpServletRequest request = (HttpServletRequest) model.asMap().get("request");
		HttpSession session = (HttpSession) model.asMap().get("session");
		
		ShopDao dao = sqlSession.getMapper(ShopDao.class);
		
		int user_id = Integer.parseInt((String) session.getAttribute("user_id"));
		
		ArrayList<BasketDto> basketDtoList = dao.selectBasketsByUser(user_id);
		ArrayList<Integer> productIds = new ArrayList<Integer>(); 
		ArrayList<ProductDto> productDtoList = new ArrayList<ProductDto>();
		for (BasketDto b : basketDtoList) {
			int product_id = b.getProduct_id();
			if (!productIds.contains(product_id)) {
				productIds.add(product_id);
				productDtoList.add(dao.selectProductById(product_id));
			}
		}
		
		model.addAttribute("baskets", basketDtoList);
		model.addAttribute("products", productDtoList);
	}

}
