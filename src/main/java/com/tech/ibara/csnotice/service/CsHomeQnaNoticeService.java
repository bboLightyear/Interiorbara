package com.tech.ibara.csnotice.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.csnotice.dao.CsHomeIDao;
import com.tech.ibara.csnotice.dto.NoticeDto;
import com.tech.ibara.csnotice.dto.QnaDto;

public class CsHomeQnaNoticeService implements CsHomeService {

	private SqlSession sqlSession;

	public CsHomeQnaNoticeService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}

	@Override
	public void execute(Model model) {

		Map<String, Object> map=model.asMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");

		CsHomeIDao dao = sqlSession.getMapper(CsHomeIDao.class);
		
		ArrayList<NoticeDto> noticelist=dao.cshomenoticelist();
		
		System.out.println("noticelist"+noticelist);
		model.addAttribute("noticelist",noticelist);
		
		
		String qnadiv = request.getParameter("qnadiv");
		System.out.println("qnadiv : "+qnadiv);
		
		if (qnadiv==null) {
			qnadiv="all";
		}
		
		if (qnadiv.equals("all")) {			
			ArrayList<QnaDto> qnalist=dao.cshomeqnalist(qnadiv,1);
			System.out.println("qnalist"+qnalist);
			model.addAttribute("qnalist",qnalist);
		}else if(qnadiv.equals("qq")) {			
			ArrayList<QnaDto> qnalist=dao.cshomeqnalist(qnadiv,2);
			System.out.println("qnalist"+qnalist);
			model.addAttribute("qnalist",qnalist);
		}else if(qnadiv.equals("oh")) {			
			ArrayList<QnaDto> qnalist=dao.cshomeqnalist(qnadiv,3);
			System.out.println("qnalist"+qnalist);
			model.addAttribute("qnalist",qnalist);
		}else if(qnadiv.equals("biz")) {			
			ArrayList<QnaDto> qnalist=dao.cshomeqnalist(qnadiv,4);
			System.out.println("qnalist"+qnalist);
			model.addAttribute("qnalist",qnalist);
		}else if(qnadiv.equals("sh")) {			
			ArrayList<QnaDto> qnalist=dao.cshomeqnalist(qnadiv,5);
			System.out.println("qnalist"+qnalist);
			model.addAttribute("qnalist",qnalist);
		}else if(qnadiv.equals("pf")) {			
			ArrayList<QnaDto> qnalist=dao.cshomeqnalist(qnadiv,6);
			System.out.println("qnalist"+qnalist);
			model.addAttribute("qnalist",qnalist);
		}
		
	}
}
