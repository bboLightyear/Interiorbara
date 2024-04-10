package com.tech.ibara.shop.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.shop.dao.ShopDao;
import com.tech.ibara.shop.dto.OrderDto;

public class OrderCompleteService extends SqlSessionBase implements ShopService {

	public OrderCompleteService(SqlSession sqlSession) {
		super(sqlSession);
	}

	@Override
	public void execute(Model model) {
		HttpServletRequest request = (HttpServletRequest) model.asMap().get("request");
		HttpSession session = (HttpSession) model.asMap().get("session");
		ShopDao dao = sqlSession.getMapper(ShopDao.class);
		
		int userId =  Integer.parseInt((String) session.getAttribute("userId"));
		int orderId = Integer.parseInt(request.getParameter("orderId"));
		
		String ordererName = request.getParameter("ordererName");
		String email = request.getParameter("email");
		int phoneNumber = Integer.parseInt(request.getParameter("phoneNumber"));
		String addrName = request.getParameter("addrName");
		String receiverName = request.getParameter("receiverName");
		int receiverPhone = Integer.parseInt(request.getParameter("receiverPhone"));
		int zipcode = Integer.parseInt(request.getParameter("zipcode"));
		String bigAddress = request.getParameter("bigAddress");
		String detailAddress = request.getParameter("detailAddress");
		String paymentType = request.getParameter("paymentType");
		
		OrderDto orderDto = new OrderDto();
		orderDto.setUser_id(userId);
		orderDto.setOrder_id(orderId);
		orderDto.setOrderer_name(ordererName);
		orderDto.setOrderer_email(email);
		orderDto.setOrderer_phone(phoneNumber);
		orderDto.setAddress_name(addrName);
		orderDto.setReceiver_name(receiverName);
		orderDto.setReceiver_phone(receiverPhone);
		orderDto.setZipcode(zipcode);
		orderDto.setBig_address(bigAddress);
		orderDto.setDetail_address(detailAddress);
		orderDto.setPayment_type(paymentType);
		
		dao.updateCompleteOrder(orderDto);		
	}

}
