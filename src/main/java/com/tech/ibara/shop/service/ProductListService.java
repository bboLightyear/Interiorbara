package com.tech.ibara.shop.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.shop.dao.ShopDao;
import com.tech.ibara.shop.dto.CategoryDto;
import com.tech.ibara.shop.dto.LevelCategoryDto;
import com.tech.ibara.shop.dto.ProductDto;

public class ProductListService implements ShopService {

	private SqlSession sqlSession;
	
	public ProductListService(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public void execute(Model model) {
		HttpServletRequest request = (HttpServletRequest) model.asMap().get("request");
		ShopDao dao = sqlSession.getMapper(ShopDao.class);
		
		String category_idStr = request.getParameter("category_id");
		int category_id = 10000;
		if (category_idStr != null) {
			category_id = Integer.parseInt(category_idStr); 
		}
		
		CategoryDto categoryDto = dao.selectCategoryById(category_id);
		if (categoryDto == null) {
			return;
		}
		ArrayList<CategoryDto> subCategoryList = dao.selectAllSubCategoriesById(category_id);
		
		
		ArrayList<ProductDto> productList = null;
		if (subCategoryList.size() == 0) {
			productList = dao.selectProductsByCategory(category_id);
		} else {
			productList = dao.selectProductsByCategories(subCategoryList);
		}
		
		ArrayList<String> categoryList = dao.selectAllCategories();
		ArrayList<LevelCategoryDto> levelCategoryList = dao.selectAllLevelCategories();
		
		model.addAttribute("levelCategories", levelCategoryList);
		model.addAttribute("categories", categoryList);
		model.addAttribute("category", categoryDto);
		model.addAttribute("productCnt", productList.size());
		model.addAttribute("productList", productList);
	}

}
