package com.tech.ibara.biz.service.cases;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.tech.ibara.biz.dao.BizIDao;
import com.tech.ibara.biz.dto.BizCasesDto;
import com.tech.ibara.biz.service.BizServiceInter;

@Service
public class BizCasesDelViewService implements BizServiceInter {

	private SqlSession sqlSession;
	
	public BizCasesDelViewService(SqlSession sqlSession) {
		// TODO Auto-generated constructor stub
		this.sqlSession=sqlSession;
	}

	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub

		System.out.println("service BizCasesDelViewService>>>");

		Map<String, Object> map=model.asMap();
		
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		BizIDao dao=sqlSession.getMapper(BizIDao.class);
		
		String bc_no=request.getParameter("bc_no");
		System.out.println(bc_no);
		
		BizCasesDto dto=dao.bizCasesDelView(bc_no);
		
		
		model.addAttribute("bizCasesDelView", dto);
		
	}

}
