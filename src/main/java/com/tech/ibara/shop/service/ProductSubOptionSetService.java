package com.tech.ibara.shop.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.shop.dao.ShopDao;
import com.tech.ibara.shop.dto.OptionDto;
import com.tech.ibara.shop.dto.OptionSetDto;

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

		OptionDto optionDto = dao.selectOptionById(optionId);
		OptionSetDto subOptionSetDto = dao.selectOptionSetById(optionDto.getSub_option_set_id());
		optionDtoList = dao.selectJoinOptionsBySet(subOptionSetDto.getOption_set_id());
	}

	@Override
	public ArrayList<OptionDto> getData() {
		return optionDtoList;
	}

}
