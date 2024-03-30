package com.tech.ibara.shop.dao;

import java.util.ArrayList;
import java.util.List;

import com.tech.ibara.shop.dto.BasketDto;
import com.tech.ibara.shop.dto.CategoryDto;
import com.tech.ibara.shop.dto.LevelCategoryDto;
import com.tech.ibara.shop.dto.OptionDto;
import com.tech.ibara.shop.dto.OptionSetDto;
import com.tech.ibara.shop.dto.ProductDataDto;
import com.tech.ibara.shop.dto.ProductDto;
import com.tech.ibara.shop.dto.ProductImgDto;

public interface ShopDao {

	public ArrayList<ProductDto> selectProductsByCategory(int categoryId);
	public ArrayList<ProductDto> selectProductsByCategories(ArrayList<CategoryDto> categoryList);
	
	public ArrayList<CategoryDto> selectAllSubCategoriesById(int categoryId);
	public ArrayList<CategoryDto> selectCategoriesByUp(int categoryId);
	public ArrayList<CategoryDto> selectLv1Categories();
	
	public CategoryDto selectCategoryById(int categoryId);
	
	public ArrayList<String> selectAllCategories();
	
	public ArrayList<LevelCategoryDto> selectAllLevelCategories();
	
	public ProductDto selectProductById(int productId);
	
	public OptionSetDto selectOptionSetByProduct(int productId);
	public OptionSetDto selectOptionSetById(int optionSetId);
	
	public ArrayList<OptionDto> selectOptionsBySet(int optionSetId);
	public OptionDto selectOptionById(int optionId);
	public OptionDto selectJoinOptionById(int optionId);
	public OptionDto selectJoinOptionBySet(int optionSetId);
	public ArrayList<OptionDto> selectJoinOptionsBySet(int optionSetId);
	
	public ProductDataDto selectProductDataById(int productDataId);
	
	public ArrayList<ProductImgDto> selectProductImgsByProduct(int productId);
	
	public ArrayList<BasketDto> selectBasketsByUser(int userId);
	
	public int selectBasketQuantity(int userId, int optionId);
	
	public void insertProductData(ProductDataDto productDataDto);
	public void insertOptionSet(OptionSetDto optionSetDto);
	public void insertOption(OptionDto optionDto);
	public void insertProduct(ProductDto productDto);
	public void insertProductImg(ProductImgDto productImgDto);
	public void insertBasket(BasketDto basketDto);
	public void insertBaskets(List<BasketDto> basketDtoList);
	
	public void updateBasketQuantity(int userId, int optionId, String action);
}
