package com.tech.ibara.shop.service;

import java.io.BufferedReader;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.tech.ibara.shop.dao.ShopDao;
import com.tech.ibara.shop.dto.BasketDto;

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
			List<Integer> basketIdList = mapper.readValue(json, new TypeReference<List<Integer>>() {});
			
			for (Integer basketId : basketIdList) {
				
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
