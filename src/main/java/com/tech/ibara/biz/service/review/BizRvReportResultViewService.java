package com.tech.ibara.biz.service.review;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.tech.ibara.biz.dao.BizIDao;
import com.tech.ibara.biz.dto.BizRvDto;
import com.tech.ibara.biz.dto.BizRvImgDto;
import com.tech.ibara.biz.service.BizServiceInter;

@Service
public class BizRvReportResultViewService implements BizServiceInter {

	private SqlSession sqlSession;
	
	public BizRvReportResultViewService(SqlSession sqlSession) {
		// TODO Auto-generated constructor stub
		this.sqlSession=sqlSession;
	}

	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub
		
		System.out.println("service BizRvReportResultViewService>>>");
		
		Map<String, Object> map=model.asMap();
		
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		BizIDao dao=sqlSession.getMapper(BizIDao.class);
		
		String br_no=request.getParameter("br_no");
		System.out.println("br_no>>>>>>>"+br_no);
		
//		dao.bizRvUpHit(br_no);
//		z
		BizRvDto dto=dao.bizRvReportResultView(br_no);
		model.addAttribute("bizRvReportResultView",dto);
	}

}
