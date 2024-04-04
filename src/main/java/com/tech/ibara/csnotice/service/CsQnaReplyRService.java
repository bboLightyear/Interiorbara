package com.tech.ibara.csnotice.service;

import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import com.tech.ibara.csnotice.dao.QnaBoardIDao;
import com.tech.ibara.csnotice.dto.QnaDto;
import com.tech.ibara.csnotice.vo.SearchVO;

public class CsQnaReplyRService implements CsQnaService {

	private SqlSession sqlSession;

	public CsQnaReplyRService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}

	@Override
	public void execute(Model model) {

		Map<String, Object> map=model.asMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");

		QnaBoardIDao dao = sqlSession.getMapper(QnaBoardIDao.class);

		String qbno = request.getParameter("qbno");
		String rqbno = request.getParameter("rqbno");
		String rwriter = request.getParameter("rwriter");
		String rcontent = request.getParameter("rcontent");
		String rqbstep = request.getParameter("rqbstep");
		String rqbgroup = request.getParameter("rqbgroup");
		String rqbindent = request.getParameter("rqbindent");

		System.out.println("qbno :" + qbno);
		System.out.println("rqbno :" + rqbno);
		System.out.println("rwriter :" + rwriter);
		System.out.println("rcontent :" + rcontent);
		System.out.println("rqbstep :" + rqbstep);
		System.out.println("rqbindent :" + rqbindent);

	}
}
