package com.tech.ibara.shop.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.shop.dao.ShopDao;
import com.tech.ibara.shop.dto.CategoryDto;
import com.tech.ibara.shop.dto.OptionDto;
import com.tech.ibara.shop.dto.OptionSetDto;
import com.tech.ibara.shop.dto.ProductDto;
import com.tech.ibara.shop.dto.ProductImgDto;

public class ProductViewService extends SqlSessionBase implements ShopService {

	public ProductViewService(SqlSession sqlSession) {
		super(sqlSession);
	}

	@Override
	public void execute(Model model) {
		HttpServletRequest request = (HttpServletRequest) model.asMap().get("request");
		ShopDao dao = sqlSession.getMapper(ShopDao.class);

		int productId = Integer.parseInt(request.getParameter("productId"));

		ProductDto productDto = dao.selectProduct(productId);

		// category
		ArrayList<CategoryDto> categories = new ArrayList<CategoryDto>();
		CategoryDto categoryDto = dao.selectCategory(productDto.getCategory_id());
		categories.add(categoryDto);
		while (categoryDto.getParent_category_id() != null) {
			categoryDto = dao.selectCategory(categoryDto.getParent_category_id());
			categories.add(0, categoryDto);
		}

		// image
		ArrayList<ProductImgDto> productImgs = dao.selectProductImgsByProduct(productId);

		
		// option
		OptionSetDto optionSetDto = null;
		OptionSetDto parentOptionSetDto = null;
		OptionDto optionDto = null;
		ArrayList<OptionDto> optionDtoList = null;
		ArrayList<OptionDto> parentOptionDtoList = null;
		switch (productDto.getOption_type()) {
		case "0": {
			int optionSetId = productDto.getOption1_set_id();
			optionSetDto = dao.selectOptionSet(optionSetId);
			optionDto = dao.selectOptionByOptionSet(optionSetId);
			
			break;
		}
		case "1": {
			int optionSetId = productDto.getOption1_set_id();
			optionSetDto = dao.selectOptionSet(optionSetId);
			optionDtoList = dao.selectOptionsByOptionSet(optionSetId);

			break;	
		}
		case "2":{
			int parentOptionSetId = productDto.getOption1_set_id();
			parentOptionSetDto = dao.selectOptionSet(parentOptionSetId);
			parentOptionDtoList = dao.selectOptionsByOptionSet(parentOptionSetId);
			
			int optionSetId = productDto.getOption2_set_id();
			optionSetDto = dao.selectOptionSet(optionSetId);
			optionDtoList = dao.selectOptionsByOptionSet(optionSetId);
			break;
		}
		}
		
		
		// option
		OptionSetDto optionSetDto = dao.selectOptionSetByProduct(productId);
		int optionSetId = optionSetDto.getOption_set_id();

		OptionDto nonOptionDto = null;
		OptionSetDto subOptionSetDto = null;

		ArrayList<OptionDto> optionDtoList = null;

		optionDtoList = dao.selectOptionsByOptionSet(optionSetId);

		if (optionDtoList.size() == 1) {
			nonOptionDto = dao.selectJoinOptionBySet(optionSetId);
		} else {
			OptionDto optionDto = optionDtoList.get(0);
			if (optionDto.getSub_option_set_id() == null) {
				optionDtoList = dao.selectJoinOptionsBySet(optionSetId);
			} else {
				subOptionSetDto = dao.selectOptionSetById(optionDto.getSub_option_set_id());
			}
		}

		model.addAttribute("product", productDto);
		model.addAttribute("categories", categories);
		model.addAttribute("images", productImgs);
		model.addAttribute("optionSet", optionSetDto);
		model.addAttribute("nonOption", nonOptionDto);
		model.addAttribute("options", optionDtoList);
		model.addAttribute("subOptionSet", subOptionSetDto);
	}

}
