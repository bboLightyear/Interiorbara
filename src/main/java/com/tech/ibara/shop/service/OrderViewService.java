package com.tech.ibara.shop.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.shop.dao.ShopDao;
import com.tech.ibara.shop.dto.OrderDto;
import com.tech.ibara.shop.dto.OrderProductDto;

public class OrderViewService extends SqlSessionBase implements ShopService {

	public OrderViewService(SqlSession sqlSession) {
		super(sqlSession);
	}

	@Override
	public void execute(Model model) {
		HttpServletRequest request = (HttpServletRequest) model.asMap().get("request");
		HttpSession session = (HttpSession) model.asMap().get("session");
		
		ShopDao dao = sqlSession.getMapper(ShopDao.class);
		
		int userId = Integer.parseInt((String) session.getAttribute("userId"));
		int orderId = Integer.parseInt(request.getParameter("orderId"));
		
		int result = 0;
		
		OrderDto orderDto = dao.selectOrderById(orderId);
		if (orderDto.getUser_id() != userId) {
			result = -1;
			
			model.addAttribute("result", result);
			
			return;
		}
		
		ArrayList<OrderProductDto> orderProductDtoList = dao.selectOrderProductsByOrder(orderId);
		
		model.addAttribute("order", orderDto);
		model.addAttribute("orderProductList", orderProductDtoList);
		model.addAttribute("result", result);
	}

}
