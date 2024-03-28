package com.tech.ibara.shop.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tech.ibara.shop.service.BasketViewService;
import com.tech.ibara.shop.service.ManagementViewService;
import com.tech.ibara.shop.service.ProductListService;
import com.tech.ibara.shop.service.ProductViewService;
import com.tech.ibara.shop.service.ShopService;

@Controller
public class ShopController {

	@Autowired
	private SqlSession sqlSession;
	
	private ShopService shopService;
	
	@RequestMapping("/shop/list")
	public String productList(HttpServletRequest request, Model model) {
		
		model.addAttribute("request", request);
		
		shopService = new ProductListService(sqlSession);
		shopService.execute(model);
		
		return "shop/list";
	}
	
	@RequestMapping("/shop/product")
	public String productView(HttpServletRequest request, Model model) {
		
		model.addAttribute("request", request);
		
		shopService = new ProductViewService(sqlSession);
		shopService.execute(model);
		
		int result = (Integer) model.asMap().get("result");
		if (result == -1) {
			return "redirect:/shop/list";
		}
		
		return "shop/product";
	}
	
	@RequestMapping("/shop/basket")
	public String basketView(HttpServletRequest request, HttpSession session, Model model) {
		
		model.addAttribute("request", request);
		model.addAttribute("session", session);
		
		shopService = new BasketViewService(sqlSession);
		shopService.execute(model);
		
		return "shop/basket";
	}
	
	@RequestMapping("/shop/management")
	public String managementView(Model model) {
		
		shopService = new ManagementViewService(sqlSession);
		shopService.execute(model);
		
		return "shop/management";
	}
}
