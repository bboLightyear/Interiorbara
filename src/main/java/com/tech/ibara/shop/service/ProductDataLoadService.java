package com.tech.ibara.shop.service;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.shop.dao.ShopDao;
import com.tech.ibara.shop.dto.OptionDto;

public class ProductDataLoadService implements ShopService {

	private SqlSession sqlSession;
	
	public ProductDataLoadService(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public void execute(Model model) {
		HttpServletRequest request = (HttpServletRequest) model.asMap().get("request");
		ShopDao dao = sqlSession.getMapper(ShopDao.class);
		
		int option_id = Integer.parseInt(request.getParameter("option_id"));
		
		OptionDto optionDto = dao.selectJoinOptionById(option_id);
		
		model.addAttribute("selectedOption", optionDto);
	}

}
