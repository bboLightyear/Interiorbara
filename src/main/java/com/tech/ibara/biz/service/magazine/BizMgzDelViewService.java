package com.tech.ibara.biz.service.magazine;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.tech.ibara.biz.dao.BizIDao;
import com.tech.ibara.biz.dto.BizMgzDto;
import com.tech.ibara.biz.service.BizServiceInter;

@Service
public class BizMgzDelViewService implements BizServiceInter {

	private SqlSession sqlSession;
	
	public BizMgzDelViewService(SqlSession sqlSession) {
		// TODO Auto-generated constructor stub
		this.sqlSession=sqlSession;
	}

	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub

		System.out.println("service BizMgzDelViewService>>>");

		Map<String, Object> map=model.asMap();
		
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		BizIDao dao=sqlSession.getMapper(BizIDao.class);
		
		String bm_no=request.getParameter("bm_no");
		System.out.println(bm_no);
		
		BizMgzDto dto=dao.bizMgzDelView(bm_no);
		
		
		model.addAttribute("bizMgzDelView", dto);
		
	}

}
