package com.tech.ibara.shop.service;

import java.io.BufferedReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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
import com.tech.ibara.shop.dto.ProductDto;

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
			
			ArrayList<BasketDto> basketDtoList = dao.selectBaskets(basketIdList);
			if (basketDtoList.size() == 0) {
				orderId = -1;
				return;
			}
			
			int totalPrice = 0;
			int deliveryFee = 0;
			int amount = 0;
			
			Map<Integer, ProductDto> productMap = new HashMap<Integer, ProductDto>();
			for (BasketDto basketDto : basketDtoList) {
				if (!productMap.containsKey(basketDto.getProduct_id())) {
					productMap.put(basketDto.getProduct_id(), basketDto.getProduct());
				}
			}
			
			for (ProductDto productDto : productMap.values()) {
				int productTotalPrice = 0;
				int productTotalDeliveryFee = 0;
				
				for (BasketDto basketDto : basketDtoList) {
					if (productDto.getProduct_id() == basketDto.getProduct_id()) {
						if (productDto.getIs_discounted() == "Y") {
							productTotalPrice += basketDto.getOption().getDiscounted_price() * basketDto.getQuantity();
						} else {
							productTotalPrice += basketDto.getOption().getPrice() * basketDto.getQuantity();
						}
						
						productTotalDeliveryFee += productDto.getDelivery_fee();
					}
				}
				
				totalPrice += productTotalPrice;
				
				switch (productDto.getDelivery_type()) {
				case "free":
					
					break;
					
				case "each":
					deliveryFee += productTotalDeliveryFee;
					break;
					
				case "over":
					if (productTotalPrice < productDto.getRef_price()) {
						deliveryFee += productTotalDeliveryFee;
					}
					break;
					
				case "arrival":
					break;
				}
			}
			
			amount = deliveryFee + totalPrice;
			
			OrderDto orderDto = new OrderDto(
					userId,
					1,
					null,
					null,
					null,
					null,
					null,
					null,
					null,
					null,
					null,
					totalPrice,
					deliveryFee,
					amount);
			
			
			dao.insertOrder(orderDto);
			orderId = orderDto.getOrder_id();
			for (BasketDto basketDto : basketDtoList) {
				int price = (basketDto.getProduct().getIs_discounted().equals("Y") ?
						basketDto.getOption().getDiscounted_price() :
						basketDto.getOption().getPrice()) * basketDto.getQuantity();
						
				dao.insertOrderProduct(new OrderProductDto(
						orderId,
						basketDto.getProduct_id(),
						basketDto.getOption_id(),
						basketDto.getProduct().getName(),
						price,
						basketDto.getProduct().getDelivery_fee(),
						basketDto.getQuantity(),
						basketDto.getOption_text()));
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
