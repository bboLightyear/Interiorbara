package com.tech.ibara.biz.service.review;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.tech.ibara.biz.dao.BizIDao;
import com.tech.ibara.biz.service.BizServiceInter;

@Service
public class BizRvModService implements BizServiceInter {

	private SqlSession sqlSession;
	
	public BizRvModService(SqlSession sqlSession) {
		// TODO Auto-generated constructor stub
		this.sqlSession=sqlSession;
	}

	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub
		System.out.println("service BizRvModService>>>");
		
		Map<String, Object> map=model.asMap();
		
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		BizIDao dao=sqlSession.getMapper(BizIDao.class);
		
		String br_no=request.getParameter("br_no");
		String orgPoint=request.getParameter("orgPoint");
		String br_point=request.getParameter("br_point");
		
		if (br_point=="") {						
			br_point=request.getParameter("orgPoint");
		}else {
			br_point=request.getParameter("br_point");
		}
		
		String br_content=request.getParameter("br_content");
		
		dao.bizRvMod(br_no, br_point, br_content);

		System.out.println(br_no);
	}

}
