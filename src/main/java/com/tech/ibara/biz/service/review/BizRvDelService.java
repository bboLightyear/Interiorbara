package com.tech.ibara.biz.service.review;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.tech.ibara.biz.dao.BizIDao;
import com.tech.ibara.biz.service.BizServiceInter;

@Service
public class BizRvDelService implements BizServiceInter {

	private SqlSession sqlSession;
	
	public BizRvDelService(SqlSession sqlSession) {
		// TODO Auto-generated constructor stub
		this.sqlSession=sqlSession;
	}

	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub

		System.out.println("service BizRvDelService>>>");
		Map<String, Object> map=model.asMap();
		
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		BizIDao dao=sqlSession.getMapper(BizIDao.class);
		
		String br_no=request.getParameter("br_no");
		
		System.out.println(br_no);
		
		dao.bizRvDel(br_no);
		dao.bizRvImgDel(br_no);
	}

}
