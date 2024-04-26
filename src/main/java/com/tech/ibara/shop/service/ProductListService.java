package com.tech.ibara.shop.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.shop.dao.ShopDao;
import com.tech.ibara.shop.dto.CategoryDto;
import com.tech.ibara.shop.dto.LevelCategoryDto;
import com.tech.ibara.shop.dto.ProductDto;

public class ProductListService extends SqlSessionBase implements ShopService {

	public ProductListService(SqlSession sqlSession) {
		super(sqlSession);
	}

	@Override
	public void execute(Model model) {
		HttpServletRequest request = (HttpServletRequest) model.asMap().get("request");
		ShopDao dao = sqlSession.getMapper(ShopDao.class);

		String categoryIdStr = request.getParameter("categoryId");
		int categoryId = 10000;
		if (categoryIdStr != null) {
			categoryId = Integer.parseInt(categoryIdStr);
		}

		CategoryDto categoryDto = dao.selectCategory(categoryId);
		if (categoryDto == null) {
			return;
		}
		ArrayList<CategoryDto> subCategoryList = dao.selectAllSubCategoriesById(categoryId);

		ArrayList<ProductDto> productList = null;
		if (subCategoryList.size() == 0) {
			productList = dao.selectProductsByCategory(categoryId);
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
