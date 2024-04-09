package com.tech.ibara.shop.dao;

import java.util.ArrayList;
import java.util.List;

import com.tech.ibara.shop.dto.BasketDto;
import com.tech.ibara.shop.dto.CategoryDto;
import com.tech.ibara.shop.dto.LevelCategoryDto;
import com.tech.ibara.shop.dto.OptionDto;
import com.tech.ibara.shop.dto.OptionSetDto;
import com.tech.ibara.shop.dto.OrderDto;
import com.tech.ibara.shop.dto.OrderProductDto;
import com.tech.ibara.shop.dto.ProductDto;
import com.tech.ibara.shop.dto.ProductImgDto;

public interface ShopDao {

	public ArrayList<ProductDto> selectProductsByCategory(int categoryId);
	public ArrayList<ProductDto> selectProductsByCategories(ArrayList<CategoryDto> categoryList);
	
	public ArrayList<CategoryDto> selectAllSubCategoriesById(int categoryId);
	public ArrayList<CategoryDto> selectCategoriesByParent(int parentCategoryId);
	public ArrayList<CategoryDto> selectLv1Categories();
	
	public CategoryDto selectCategory(int categoryId);
	
	public ArrayList<String> selectAllCategories();
	
	public ArrayList<LevelCategoryDto> selectAllLevelCategories();
	
	public ProductDto selectProduct(int productId);
	public ProductDto selectProductJoinSeller(int productId);
	
	public OptionSetDto selectOptionSetByProduct(int productId);
	public OptionSetDto selectOptionSet(int optionSetId);
	
	public ArrayList<OptionDto> selectOptionsByOptionSet(int optionSetId);
	public ArrayList<OptionDto> selectOptionsByParentOption(int optionId);
	public OptionDto selectOptionByOptionSet(int optionSetId);
	public OptionDto selectOption(int optionId);
	
	public ArrayList<ProductImgDto> selectProductImgsByProduct(int productId);
	
	public int selectBasketQuantity(int userId, int optionId);
	public ArrayList<BasketDto> selectBasketsByUser(int userId);
	public ArrayList<BasketDto> selectBaskets(ArrayList<Integer> basketIdList);
	
	public OrderDto selectOrderById(int orderId);
	public ArrayList<OrderProductDto> selectOrderProductsByOrder(int orderId);
	
	public void insertOptionSet(OptionSetDto optionSetDto);
	public void insertOption(OptionDto optionDto);
	public void insertProduct(ProductDto productDto);
	public void insertProductImg(ProductImgDto productImgDto);
	public void insertBasket(BasketDto basketDto);
	public void insertBaskets(List<BasketDto> basketDtoList);
	public void insertOrder(OrderDto orderDto);
	public void insertOrderProduct(OrderProductDto orderProductDto);
	
	public void updateBasketQuantity(int userId, int optionId, String action);
	
	public void deleteBasket(int userId, int targetId, String target);
}
