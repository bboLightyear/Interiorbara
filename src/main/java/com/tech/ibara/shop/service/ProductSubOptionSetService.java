package com.tech.ibara.shop.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.shop.dao.ShopDao;
import com.tech.ibara.shop.dto.OptionDto;
import com.tech.ibara.shop.dto.OptionSetDto;

public class ProductSubOptionSetService implements ShopService {

	private SqlSession sqlSession;
	
	public ProductSubOptionSetService(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public void execute(Model model) {
		HttpServletRequest request = (HttpServletRequest) model.asMap().get("request");
		ShopDao dao = sqlSession.getMapper(ShopDao.class);
		
		int option_id = Integer.parseInt(request.getParameter("option_id"));
		
		OptionDto optionDto = dao.selectOptionById(option_id);
		OptionSetDto subOptionSetDto = dao.selectOptionSetById(optionDto.getSub_option_set_id());
		ArrayList<OptionDto> optionDtoList = dao.selectJoinOptionsBySet(subOptionSetDto.getOption_set_id());
		
		model.addAttribute("subOptions", optionDtoList);
	}

}
