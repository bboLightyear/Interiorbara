package com.tech.ibara.csnotice;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.tech.ibara.csnotice.dao.NoticeBoardIDao;
import com.tech.ibara.csnotice.dao.QnaBoardIDao;
import com.tech.ibara.csnotice.dto.NoticeReplyDto;
import com.tech.ibara.csnotice.dto.QnaReplyDto;

@RestController
public class CsNoticeRestController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(method = RequestMethod.POST,value = "/nreply")
	public ArrayList<NoticeReplyDto> reply(HttpServletRequest request) throws ClassNotFoundException, SQLException {
		System.out.println("noticereply()");
		
		NoticeBoardIDao dao=sqlSession.getMapper(NoticeBoardIDao.class);
		
		String nbno=request.getParameter("nbno");
		String rnbno=request.getParameter("rnbno");		
		String rwriter=request.getParameter("rwriter");		
		String rcontent=request.getParameter("rcontent");		
		String rnbstep=request.getParameter("rnbstep");		
		String rnbgroup=request.getParameter("rnbgroup");		
		String rnbindent=request.getParameter("rnbindent");		
		
		System.out.println("nbno :"+nbno);
		System.out.println("rnbno :"+rnbno);
		System.out.println("rwriter :"+rwriter);
		System.out.println("rcontent :"+rcontent);
		System.out.println("rnbstep :"+rnbstep);
		System.out.println("rnbgroup :"+rnbgroup);
		System.out.println("rnbindent :"+rnbindent);
		
		dao.replyShape(rnbgroup,rnbstep);
		
		// 전체 답글 달기
		dao.noticereply_r(nbno,rnbno,rwriter,rcontent,rnbgroup,rnbstep,rnbindent);

		ArrayList<NoticeReplyDto> list = dao.replyrlist(rnbno);
		System.out.println(list.size());
		return list;
	}
	
	@RequestMapping(method = RequestMethod.POST,value = "/nreplyview")
	public ArrayList<NoticeReplyDto> replyview(HttpServletRequest request) throws ClassNotFoundException, SQLException {
		System.out.println("replyview()");
		
		NoticeBoardIDao dao=sqlSession.getMapper(NoticeBoardIDao.class);
		
		String rnbno=request.getParameter("rnbno");			
		
		System.out.println("rest rnbno :"+rnbno);
		
		ArrayList<NoticeReplyDto> list = dao.replyrlist(rnbno);
		System.out.println(list.size());
		return list;
	}

}
