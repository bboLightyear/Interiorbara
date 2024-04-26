package com.tech.ibara.shop.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.shop.dao.ShopDao;
import com.tech.ibara.shop.dto.BasketDto;
import com.tech.ibara.shop.dto.ProductDto;

public class BasketViewService extends SqlSessionBase implements ShopService {

	public BasketViewService(SqlSession sqlSession) {
		super(sqlSession);
	}

	@Override
	public void execute(Model model) {
//		HttpServletRequest request = (HttpServletRequest) model.asMap().get("request");
		HttpSession session = (HttpSession) model.asMap().get("session");
		
		ShopDao dao = sqlSession.getMapper(ShopDao.class);
		
		int userId = Integer.parseInt((String) session.getAttribute("userId"));
		
		ArrayList<BasketDto> basketDtoList = dao.selectBasketsByUser(userId);
		ArrayList<Integer> productIds = new ArrayList<Integer>(); 
		ArrayList<ProductDto> productDtoList = new ArrayList<ProductDto>();
		for (BasketDto b : basketDtoList) {
			int productId = b.getProduct_id();
			if (!productIds.contains(productId)) {
				productIds.add(productId);
				productDtoList.add(dao.selectProduct(productId));
			}
		}
		
		model.addAttribute("baskets", basketDtoList);
		model.addAttribute("products", productDtoList);
	}

}
