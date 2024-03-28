package com.tech.ibara.shop.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.tech.ibara.shop.dto.CategoryDto;
import com.tech.ibara.shop.dto.OptionDto;
import com.tech.ibara.shop.service.ProductDataLoadService;
import com.tech.ibara.shop.service.ProductSubOptionSetService;
import com.tech.ibara.shop.service.ShopService;
import com.tech.ibara.shop.service.SubCategoryLoadService;

@RestController
public class ShopRestController {

	@Autowired
	private SqlSession sqlSession;
	
	private ShopService shopService;
	
	@RequestMapping(method = RequestMethod.GET, value = "/shop/loadSubOptionSet")
	public ArrayList<OptionDto> loadSubOptionSet(HttpServletRequest request, Model model) {
		
		model.addAttribute("request", request);
		
		shopService = new ProductSubOptionSetService(sqlSession);
		shopService.execute(model);
		
		return (ArrayList<OptionDto>) model.asMap().get("subOptions");
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/shop/loadProductData")
	public OptionDto loadProductData(HttpServletRequest request, Model model) {
		
		model.addAttribute("request", request);
		
		shopService = new ProductDataLoadService(sqlSession);
		shopService.execute(model);
		
		return (OptionDto) model.asMap().get("selectedOption");
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/shop/loadSubCategories")
	public ArrayList<CategoryDto> loadSubCategory(HttpServletRequest request, Model model) {
		
		model.addAttribute("request", request);
		
		shopService = new SubCategoryLoadService(sqlSession);
		shopService.execute(model);
		
		return (ArrayList<CategoryDto>) model.asMap().get("subCategories");
	}
}
