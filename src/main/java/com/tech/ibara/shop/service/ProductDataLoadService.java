package com.tech.ibara.shop.service;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.shop.dao.ShopDao;
import com.tech.ibara.shop.dto.OptionDto;

public class ProductDataLoadService extends SqlSessionBase implements ShopRestService<OptionDto> {

	private OptionDto optionDto;

	public ProductDataLoadService(SqlSession sqlSession) {
		super(sqlSession);
	}

	@Override
	public void execute(Model model) {
		HttpServletRequest request = (HttpServletRequest) model.asMap().get("request");
		ShopDao dao = sqlSession.getMapper(ShopDao.class);

		int optionId = Integer.parseInt(request.getParameter("optionId"));

		optionDto = dao.selectOption(optionId);
	}

	@Override
	public OptionDto getData() {
		return optionDto;
	}

}
