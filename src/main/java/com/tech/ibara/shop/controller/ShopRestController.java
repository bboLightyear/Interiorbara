package com.tech.ibara.shop.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.tech.ibara.shop.dto.BasketDto;
import com.tech.ibara.shop.dto.CategoryDto;
import com.tech.ibara.shop.dto.OptionDto;
import com.tech.ibara.shop.service.BasketAddService;
import com.tech.ibara.shop.service.BasketMakeOrderService;
import com.tech.ibara.shop.service.BasketModifyQuantityService;
import com.tech.ibara.shop.service.BasketRemoveService;
import com.tech.ibara.shop.service.ProductDataLoadService;
import com.tech.ibara.shop.service.ProductSubOptionSetService;
import com.tech.ibara.shop.service.SubCategoryLoadService;

@RestController
public class ShopRestController {

	@Autowired
	private SqlSession sqlSession;
	
//	@SuppressWarnings("unchecked")
	@RequestMapping(method = RequestMethod.GET, value = "/shop/loadSubOptionSet")
	public ArrayList<OptionDto> loadSubOptionSet(HttpServletRequest request, Model model) {
		
		model.addAttribute("request", request);
		
		ProductSubOptionSetService shopService = new ProductSubOptionSetService(sqlSession);
		shopService.execute(model);

		return shopService.getData();
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/shop/loadProductData")
	public OptionDto loadProductData(HttpServletRequest request, Model model) {
		
		model.addAttribute("request", request);
		
		ProductDataLoadService shopService = new ProductDataLoadService(sqlSession);
		shopService.execute(model);
		
		return shopService.getData();
	}
	
//	@SuppressWarnings("unchecked")
	@RequestMapping(method = RequestMethod.GET, value = "/shop/loadSubCategories")
	public ArrayList<CategoryDto> loadSubCategory(HttpServletRequest request, Model model) {
		
		model.addAttribute("request", request);
		
		SubCategoryLoadService shopService = new SubCategoryLoadService(sqlSession);
		shopService.execute(model);
		
		return shopService.getData();
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/shop/addBasket")
	public void addBasket(HttpServletRequest request, HttpSession session ,Model model) {
		
		model.addAttribute("request", request);
		model.addAttribute("session", session);
		
		BasketAddService shopService = new BasketAddService(sqlSession);
		shopService.execute(model);
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/shop/basket/modifyQuantity")
	public ArrayList<BasketDto> basketModifyQuantity(HttpServletRequest request, HttpSession session ,Model model) {
		
		model.addAttribute("request", request);
		model.addAttribute("session", session);
		
		BasketModifyQuantityService shopService = new BasketModifyQuantityService(sqlSession);
		shopService.execute(model);
		
		return shopService.getData();
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/shop/basket/removeBasket")
	public ArrayList<BasketDto> removeBasket(HttpServletRequest request, HttpSession session ,Model model) {
		
		model.addAttribute("request", request);
		model.addAttribute("session", session);
		
		BasketRemoveService shopService = new BasketRemoveService(sqlSession);
		shopService.execute(model);
		
		return shopService.getData();
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/shop/basket/makeOrder")
	public int makeOrder(HttpServletRequest request, HttpSession session ,Model model) {
		
		model.addAttribute("request", request);
		model.addAttribute("session", session);
		
		BasketMakeOrderService shopService = new BasketMakeOrderService(sqlSession);
		shopService.execute(model);
		
		return shopService.getData();
	}
}
