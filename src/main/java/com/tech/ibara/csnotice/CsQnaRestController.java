package com.tech.ibara.csnotice;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.tech.ibara.csnotice.dao.QnaBoardIDao;
import com.tech.ibara.csnotice.dto.QnaReplyDto;

@RestController
public class CsQnaRestController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(method = RequestMethod.POST,value = "/reply")
	public ArrayList<QnaReplyDto> reply(HttpServletRequest request) throws ClassNotFoundException, SQLException {
		System.out.println("qnareply()");
		
		QnaBoardIDao dao=sqlSession.getMapper(QnaBoardIDao.class);
		
		String qbno=request.getParameter("qbno");
		String rqbno=request.getParameter("rqbno");		
		String rwriter=request.getParameter("rwriter");		
		String rcontent=request.getParameter("rcontent");		
		String rqbstep=request.getParameter("rqbstep");		
		String rqbgroup=request.getParameter("rqbgroup");		
		String rqbindent=request.getParameter("rqbindent");		
		
		System.out.println("qbno :"+qbno);
		System.out.println("rqbno :"+rqbno);
		System.out.println("rwriter :"+rwriter);
		System.out.println("rcontent :"+rcontent);
		System.out.println("rqbstep :"+rqbstep);
		System.out.println("rqbgroup :"+rqbgroup);
		System.out.println("rqbindent :"+rqbindent);
		
		dao.replyShape(rqbgroup,rqbstep);
		
		// 전체 답글 달기
		dao.qnareply_r(qbno,rqbno,rwriter,rcontent,rqbgroup,rqbstep,rqbindent);

		ArrayList<QnaReplyDto> list = dao.replyrlist(rqbno);
		System.out.println(list.size());
		return list;
	}
	
	@RequestMapping(method = RequestMethod.POST,value = "/replyview")
	public ArrayList<QnaReplyDto> replyview(HttpServletRequest request) throws ClassNotFoundException, SQLException {
		System.out.println("replyview()");
		
		QnaBoardIDao dao=sqlSession.getMapper(QnaBoardIDao.class);
		
		String rqbno=request.getParameter("rqbno");			
		
		System.out.println("rest rqbno :"+rqbno);
		
		ArrayList<QnaReplyDto> list = dao.replyrlist(rqbno);
		System.out.println(list.size());
		return list;
	}

}
