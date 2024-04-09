package com.tech.ibara.shop.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.shop.dao.ShopDao;
import com.tech.ibara.shop.dto.QnaDto;

public class QnaRegService extends SqlSessionBase implements ShopService {

	public QnaRegService(SqlSession sqlSession) {
		super(sqlSession);
	}

	@Override
	public void execute(Model model) {
		HttpServletRequest request = (HttpServletRequest) model.asMap().get("request");
		HttpSession session = (HttpSession) model.asMap().get("session");
		ShopDao dao = sqlSession.getMapper(ShopDao.class);
		
		int userId =  Integer.parseInt((String) session.getAttribute("userId"));
		int productId = Integer.parseInt(request.getParameter("productId"));
		String content = request.getParameter("qnaContent");
		
		QnaDto qnaDto = new QnaDto(productId, userId, content);
		
		dao.insertQna(qnaDto);
	}
}
