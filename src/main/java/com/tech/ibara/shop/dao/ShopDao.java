package com.tech.ibara.shop.dao;

import java.util.ArrayList;

import com.tech.ibara.shop.dto.BasketDto;
import com.tech.ibara.shop.dto.CategoryDto;
import com.tech.ibara.shop.dto.LevelCategoryDto;
import com.tech.ibara.shop.dto.OptionDto;
import com.tech.ibara.shop.dto.OptionSetDto;
import com.tech.ibara.shop.dto.ProductDataDto;
import com.tech.ibara.shop.dto.ProductDto;
import com.tech.ibara.shop.dto.ProductImgDto;

public interface ShopDao {

	public ArrayList<ProductDto> selectProductsByCategory(int category_id);
	public ArrayList<ProductDto> selectProductsByCategories(ArrayList<CategoryDto> categoryList);
	
	public ArrayList<CategoryDto> selectAllSubCategoriesById(int category_id);
	public ArrayList<CategoryDto> selectCategoriesByUp(int category_id);
	public ArrayList<CategoryDto> selectLv1Categories();
	
	public CategoryDto selectCategoryById(int category_id);
	
	public ArrayList<String> selectAllCategories();
	
	public ArrayList<LevelCategoryDto> selectAllLevelCategories();
	
	public ProductDto selectProductById(int product_id);
	
	public OptionSetDto selectOptionSetByProduct(int product_id);
	public OptionSetDto selectOptionSetById(int option_set_id);
	

	public ArrayList<OptionDto> selectOptionsBySet(int option_set_id);
	public OptionDto selectOptionById(int option_id);
	public OptionDto selectJoinOptionById(int option_id);
	public OptionDto selectJoinOptionBySet(int option_set_id);
	public ArrayList<OptionDto> selectJoinOptionsBySet(int option_set_id);
	
	public ProductDataDto selectProductDataById(int product_data_id);
	
	public ArrayList<ProductImgDto> selectProductImgsByProduct(int product_id);
	
	public ArrayList<BasketDto> selectBasketsByUser(int user_id);

}
