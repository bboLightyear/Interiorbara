package com.tech.ibara.shop.service;

import java.io.BufferedReader;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.tech.ibara.shop.dao.ShopDao;
import com.tech.ibara.shop.dto.BasketDto;
import com.tech.ibara.shop.dto.OrderDto;
import com.tech.ibara.shop.dto.OrderProductDto;

public class BasketMakeOrderService extends SqlSessionBase implements ShopRestService<Integer> {

	private int orderId;
	
	public BasketMakeOrderService(SqlSession sqlSession) {
		super(sqlSession);
	}

	@Override
	public void execute(Model model) {
		HttpServletRequest request = (HttpServletRequest) model.asMap().get("request");
		HttpSession session = (HttpSession) model.asMap().get("session");
		ShopDao dao = sqlSession.getMapper(ShopDao.class);
		
		int userId = Integer.parseInt((String) session.getAttribute("userId"));
		
		try {
			BufferedReader reader = request.getReader();
			StringBuilder builder = new StringBuilder();
			String line;
			while ((line = reader.readLine()) != null) {
				builder.append(line);
			}
			
			String json = builder.toString();
			
			ObjectMapper mapper = new ObjectMapper();
			ArrayList<Integer> basketIdList = mapper.readValue(json, new TypeReference<ArrayList<Integer>>() {});
			
			ArrayList<BasketDto> basketDtoList = dao.selectBasketsByIds(basketIdList);
			if (basketDtoList.size() == 0) {
				orderId = -1;
				return;
			}
			
			ArrayList<Integer> productIdList = new ArrayList<Integer>();
			int amount = 0;
			for (BasketDto b : basketDtoList) {
				if (!productIdList.contains(b.getProduct_id())) {
					productIdList.add(b.getProduct_id());
					amount += b.getProduct_dto().getDelivery_fee();
				}
				if (b.getProduct_data_dto().getDiscounted_price() != null) {
					amount += b.getProduct_data_dto().getDiscounted_price() * b.getQuantity();
				} else {
					amount += b.getProduct_data_dto().getPrice() * b.getQuantity();
				} 
			}
			
			OrderDto orderDto = new OrderDto(userId, 1, null, null, null, null, amount);
			
			
			dao.insertOrder(orderDto);
			orderId = orderDto.getOrder_id();
			for (BasketDto b : basketDtoList) {
				int price = b.getProduct_data_dto().getDiscounted_price() != null ?
						b.getProduct_data_dto().getDiscounted_price() : 
						b.getProduct_data_dto().getPrice();
				
				String optionText = "";
				
				if (b.getOption_set_dto() != null) {
					optionText += b.getOption_set_dto().getName() + ": " + b.getOption_dto().getName() + " / ";
				}
				
				if (b.getFinal_option_set_dto() != null) {
					optionText += b.getFinal_option_set_dto().getName() + ": ";
				}
				
				optionText += b.getFinal_option_dto().getName();
						
				dao.insertOrderProduct(new OrderProductDto(
						orderId,
						b.getProduct_id(),
						b.getOption_id(),
						b.getProduct_dto().getName(),
						price,
						b.getQuantity(),
						optionText));
			}

			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public Integer getData() {
		return orderId;
	}
}
