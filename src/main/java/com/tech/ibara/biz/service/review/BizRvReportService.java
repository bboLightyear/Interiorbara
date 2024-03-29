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
		String user_idno=request.getParameter("user_idno");
		String cause=request.getParameter("cause");
		System.out.println("br_no>>>>>>>"+br_no);
		System.out.println("user_idno>>>>>>>"+user_idno);
		System.out.println("cause>>>>>>>"+cause);
//		String memno=request.getParameter("session.memno"); //추후 신고한 회원 memno 세션에서 받아와야함
		
		dao.bizRvReport(br_no, user_idno, cause);
		
		BizRvDto dto=dao.bizRvContentView(br_no);
		
		String brr_content=dto.getBr_content();
		String brr_writer=dto.getBr_writer();
		int brr_like_cnt=dto.getBr_like_cnt();
		Timestamp brr_date=dto.getBr_date();
		float brr_point=dto.getBr_point();
		int biz_idno=dto.getBiz_idno();
		
		dao.bizRvReportedWrite(brr_content, brr_writer,brr_like_cnt,brr_date,brr_point,biz_idno,user_idno,br_no);
		
		
	}

}
