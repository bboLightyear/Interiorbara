package com.tech.ibara.shop.service;

import java.io.BufferedReader;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.shop.api.PortOneAPI;
import com.tech.ibara.shop.dao.ShopDao;
import com.tech.ibara.shop.dto.OrderDto;
import com.tech.ibara.shop.vo.ShopUtil;

public class OrderVerifyService extends SqlSessionBase implements ShopService {

	public OrderVerifyService(SqlSession sqlSession) {
		super(sqlSession);
	}

	@Override
	public void execute(Model model) {
		HttpServletRequest request = (HttpServletRequest) model.asMap().get("request");
		HttpServletResponse response = (HttpServletResponse) model.asMap().get("response");
		ShopDao dao = sqlSession.getMapper(ShopDao.class);
		
		Map<String, Object> map = null;
		
		try {
			BufferedReader reader = request.getReader();
			StringBuilder builder = new StringBuilder();
			String line;
			while ((line = reader.readLine()) != null) {
				builder.append(line);
			}
			
			String json = builder.toString();
			
			map = ShopUtil.jsonToMap(json);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		int orderId = Integer.parseInt((String) map.get("merchant_uid"));
		String status = (String) map.get("status");
		

		if (status.equals("paid")) {
			try {
				
				OrderDto orderDto = dao.selectOrderById(orderId);
				
				int amount = orderDto.getAmount();
				
				Map<String, Object> responseParams = new HashMap<String, Object>();
				String jsonResponse;
				
				if (PortOneAPI.getInstance().verify(orderId, amount)){
					response.setStatus(HttpServletResponse.SC_OK);
					
					responseParams.put("status", "success");
					responseParams.put("message", "결제 성공");
					
					jsonResponse = ShopUtil.mapToJson(responseParams);
					
				} else {
					response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
					
					responseParams.put("status", "forgery");
					responseParams.put("message", "위조된 결제시도");
					
					jsonResponse = ShopUtil.mapToJson(responseParams);
					
					// 결제 취소 코드
				}
				
				response.getWriter().write(jsonResponse);
				response.getWriter().flush();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}

}
