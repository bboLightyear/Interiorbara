package com.tech.ibara.shop.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tech.ibara.shop.service.BasketViewService;
import com.tech.ibara.shop.service.ManagementViewService;
import com.tech.ibara.shop.service.OrderViewService;
import com.tech.ibara.shop.service.ProductListService;
import com.tech.ibara.shop.service.ProductRegService;
import com.tech.ibara.shop.service.ProductViewService;
import com.tech.ibara.shop.service.QnaRegService;
import com.tech.ibara.shop.service.ReviewRegService;
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
	
	@RequestMapping("/shop/management/regProduct")
	public String regProduct(MultipartHttpServletRequest mpRequest, Model model) {
		
		model.addAttribute("mpRequest", mpRequest);
		
		shopService = new ProductRegService(sqlSession);
		shopService.execute(model);
		
		return "redirect:/shop/management";
	}
	
	@RequestMapping("/shop/order")
	public String orderView(HttpServletRequest request, HttpSession session, Model model) {
		
		model.addAttribute("request", request);
		model.addAttribute("session", session);
		
		shopService = new OrderViewService(sqlSession);
		shopService.execute(model);
		
		return "shop/order";
	}
	
	@RequestMapping("/shop/product/regReview")
	public String regReview(MultipartHttpServletRequest mpRequest, HttpSession session, Model model) {
		
		model.addAttribute("mpRequest", mpRequest);
		model.addAttribute("session", session);
		
		shopService = new ReviewRegService(sqlSession);
		shopService.execute(model);
		
		int productId = Integer.parseInt(mpRequest.getParameter("productId"));
		
		return String.format("redirect:/shop/product?productId=%d", productId);
	}
	
	@RequestMapping("/shop/product/regQna")
	public String regQna(HttpServletRequest request, HttpSession session, Model model) {
		
		model.addAttribute("request", request);
		model.addAttribute("session", session);
		
		shopService = new QnaRegService(sqlSession);
		shopService.execute(model);
		
		int productId = Integer.parseInt(request.getParameter("productId"));
		
		return String.format("redirect:/shop/product?productId=%d", productId);
	}
}
