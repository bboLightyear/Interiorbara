package com.tech.ibara.shop.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.shop.dao.ShopDao;
import com.tech.ibara.shop.dto.CategoryDto;

public class ManagementViewService implements ShopService {

	private SqlSession sqlSession;
	
	public ManagementViewService(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public void execute(Model model) {
//		HttpServletRequest request = (HttpServletRequest) model.asMap().get("request");
		ShopDao dao = sqlSession.getMapper(ShopDao.class);
		
		ArrayList<CategoryDto> lv1Categories = dao.selectLv1Categories();
		
		model.addAttribute("lv1Categories", lv1Categories);
	}

}
