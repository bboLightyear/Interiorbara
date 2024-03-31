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
		
//		String sql="select * from dept";
//		Class.forName("oracle.jdbc.driver.OracleDriver");
//		String url="jdbc:oracle:thin:@localhost:1521:xe";
//		String user="hr";
//		String pw="123456";
//		Connection conn=DriverManager.getConnection(url,user,pw);
//		Statement stmt=conn.createStatement();

		
		dao.replyShape(rnbgroup,rnbstep);
		
		// 전체 답글 달기
		dao.qnareply_r(nbno,rnbno,rwriter,rcontent,rnbgroup,rnbstep,rnbindent);
//		dao.qnareply(nbno,rwriter,rcontent);
		ArrayList<QnaReplyDto> list = dao.replyrlist(rnbno);
		System.out.println(list.size());
		return list;
	}

}
