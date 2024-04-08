package com.tech.ibara.shop.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.shop.dao.ShopDao;
import com.tech.ibara.shop.dto.ReviewDto;
import com.tech.ibara.shop.vo.PageVO;

public class ReviewPageChangeService extends SqlSessionBase implements ShopRestService<Map<String, Object>> {

	private Map<String, Object> data;
	
	public ReviewPageChangeService(SqlSession sqlSession) {
		super(sqlSession);
	}

	@Override
	public void execute(Model model) {
		HttpServletRequest request = (HttpServletRequest) model.asMap().get("request");
		ShopDao dao = sqlSession.getMapper(ShopDao.class);
		
		int productId = Integer.parseInt(request.getParameter("productId"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));;
		
		PageVO pageVO = new PageVO();
		pageVO.setPageSelectedNum(pageNum);
		pageVO.pageAndPostCalculate(dao.selectReviewsCount(productId));
		ArrayList<ReviewDto>reviewDtoList = dao.selectReviewsPageByProduct(
				productId, pageVO.getPostStartNum(), pageVO.getPostEndNum());
		
		data = new HashMap<String, Object>();
		
		data.put("pageVO", pageVO);
		data.put("reviews", reviewDtoList);
	}

	@Override
	public Map<String, Object> getData() {
		return data;
	}
}
