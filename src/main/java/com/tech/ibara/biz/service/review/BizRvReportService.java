package com.tech.ibara.biz.service.review;

import java.sql.Timestamp;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.tech.ibara.biz.dao.BizIDao;
import com.tech.ibara.biz.dto.BizRvDto;
import com.tech.ibara.biz.service.BizServiceInter;

@Service
public class BizRvReportService implements BizServiceInter {

	private SqlSession sqlSession;
	
	public BizRvReportService(SqlSession sqlSession) {
		// TODO Auto-generated constructor stub
		this.sqlSession=sqlSession;
	}

	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub

		System.out.println("service BizRvReportService>>>");
		Map<String, Object> map=model.asMap();
		
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		BizIDao dao=sqlSession.getMapper(BizIDao.class);
		
		String br_no=request.getParameter("br_no");
		String memno=request.getParameter("memno");
		String cause=request.getParameter("cause");
		String inteno=request.getParameter("inteno");
		System.out.println("br_no>>>>>>>"+br_no);
		System.out.println("memno>>>>>>>"+memno);
		System.out.println("cause>>>>>>>"+cause);
//		String memno=request.getParameter("session.memno"); //추후 신고한 회원 memno 세션에서 받아와야함
		
		dao.bizRvReport(br_no, memno, cause);
		
		BizRvDto dto=dao.bizRvContentView(br_no);
		
		String brr_content=dto.getBr_content();
		String brr_writer=dto.getBr_writer();
		
		dao.bizRvReportedWrite(brr_content, brr_writer, br_no);
		
		
	}

}
