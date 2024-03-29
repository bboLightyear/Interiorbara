package com.tech.ibara.shop.service;

import java.io.BufferedReader;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.fasterxml.jackson.databind.ObjectMapper;
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
		
		int userId =  Integer.parseInt((String) session.getAttribute("userId"));
		
		try {
			BufferedReader reader = request.getReader();
			StringBuilder builder = new StringBuilder();
			String line;
			while ((line = reader.readLine()) != null) {
				builder.append(line);
			}
			
			String json = builder.toString();
			
			System.out.println(json);
			
//			ObjectMapper mapper = new ObjectMapper();
//			mapper.readValue(json, BasketDto.class);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
//		BasketDto basketDto = new BasketDto(
//				Integer.parseInt(request.getParameter("user_id")),
//				Integer.parseInt(request.getParameter("product_id")),
//				Integer.parseInt(request.getParameter("option_id")),
//				Integer.parseInt(request.getParameter("quantity")));
//		
//		dao.insertBasket(basketDto);
	}

}
