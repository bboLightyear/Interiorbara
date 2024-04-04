package com.tech.ibara.csnotice.service;

import java.util.ArrayList;
import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.csnotice.dao.CsHomeIDao;
import com.tech.ibara.csnotice.dto.NoticeDto;

public class CsHomeQnaNoticeService implements CsHomeService {

	private SqlSession sqlSession;

	public CsHomeQnaNoticeService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}

	@Override
	public void execute(Model model) {

		CsHomeIDao dao = sqlSession.getMapper(CsHomeIDao.class);
		
		ArrayList<NoticeDto> noticelist=dao.cshomenoticelist();
		
		System.out.println("noticelist"+noticelist);
		
		model.addAttribute("noticelist",noticelist);
	}
}
