package com.tech.ibara.shop.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.shop.dao.ShopDao;
import com.tech.ibara.shop.dto.OptionDto;

public class ProductSubOptionSetService extends SqlSessionBase implements ShopRestService<ArrayList<OptionDto>> {

	private ArrayList<OptionDto> optionDtoList;

	public ProductSubOptionSetService(SqlSession sqlSession) {
		super(sqlSession);
	}

	@Override
	public void execute(Model model) {
		HttpServletRequest request = (HttpServletRequest) model.asMap().get("request");
		ShopDao dao = sqlSession.getMapper(ShopDao.class);

		int optionId = Integer.parseInt(request.getParameter("optionId"));

		optionDtoList = dao.selectOptionsByParentOption(optionId);
	}

	@Override
	public ArrayList<OptionDto> getData() {
		return optionDtoList;
	}

}
