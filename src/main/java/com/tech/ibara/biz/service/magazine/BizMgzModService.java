package com.tech.ibara.biz.service.magazine;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.tech.ibara.biz.dao.BizIDao;
import com.tech.ibara.biz.service.BizServiceInter;

@Service
public class BizMgzModService implements BizServiceInter {

	private SqlSession sqlSession;
	
	public BizMgzModService(SqlSession sqlSession) {
		// TODO Auto-generated constructor stub
		this.sqlSession=sqlSession;
	}

	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub
		System.out.println("service BizMgzModService>>>");
		
		Map<String, Object> map=model.asMap();
		
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		BizIDao dao=sqlSession.getMapper(BizIDao.class);
		
		String bm_no=request.getParameter("bm_no");
		String bm_title=request.getParameter("bm_title");
		String bm_content=request.getParameter("bm_content");
		
		dao.bizMgzMod(bm_no, bm_title, bm_content);

		System.out.println(bm_no);
	}

}
