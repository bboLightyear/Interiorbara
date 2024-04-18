package com.tech.ibara.my.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.my.dao.MyDao;
import com.tech.ibara.my.dto.MyReportDto;

public class BlindCheckService implements VService{
	private SqlSession sqlSession;
	public BlindCheckService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	@Override
	public void execute(Model model) {
		Map<String, Object> map= model.asMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		String reno=request.getParameter("reno");
		MyDao mdao=sqlSession.getMapper(MyDao.class);
//		String yesno=mdao.yesnoCheck_Report(reno);
		MyReportDto rdto=mdao.getReportRv(reno);
		String yesno=rdto.getYesno();
		System.out.println("yesno : "+yesno);
		int br_no=rdto.getTargetno();
		String br_content=rdto.getBizRvReportedDto().getBrr_content();
		String br_writer=rdto.getBizRvReportedDto().getBrr_writer();
		String targettype=rdto.getTargettype();
		System.out.println("targettype : "+targettype);
		System.out.println("br_no : "+br_no);
		System.out.println("br_content : "+br_content);
		System.out.println("br_writer : "+br_writer);
		if(yesno.equals("N")) {// Y로 바꿔주고 원글은 블라인드처리하기
			mdao.allowBlind("Y", reno);
			mdao.blindReview(br_no);
		}else {//N로 바꿔주고 원글 살리기 
			mdao.allowBlind("N", reno);
			mdao.saveReview(br_content,br_writer,br_no);
		}
	}
}
