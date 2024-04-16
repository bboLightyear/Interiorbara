package com.tech.ibara.shop.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.shop.dao.ShopDao;
import com.tech.ibara.shop.dto.QnaDto;
import com.tech.ibara.shop.vo.PageVO;

public class QnaPageChangeService extends SqlSessionBase implements ShopRestService<Map<String, Object>> {

	private Map<String, Object> data;
	
	public QnaPageChangeService(SqlSession sqlSession) {
		super(sqlSession);
	}

	@Override
	public void execute(Model model) {
		HttpServletRequest request = (HttpServletRequest) model.asMap().get("request");
		ShopDao dao = sqlSession.getMapper(ShopDao.class);
		
		int productId = Integer.parseInt(request.getParameter("productId"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));;
		
		PageVO qnaPageVO = new PageVO();
		qnaPageVO.setPageSelectedNum(pageNum);
		qnaPageVO.pageAndPostCalculate(dao.selectQnasCount(productId));
		ArrayList<QnaDto>qnaDtoList = dao.selectQnasPageByProduct(
				productId, qnaPageVO.getPostStartNum(), qnaPageVO.getPostEndNum());
		
		data = new HashMap<String, Object>();
		
		data.put("qnaPageVO", qnaPageVO);
		data.put("qnas", qnaDtoList);
	}

	@Override
	public Map<String, Object> getData() {
		return data;
	}
}
