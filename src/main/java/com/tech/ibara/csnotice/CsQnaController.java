package com.tech.ibara.csnotice;

import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tech.ibara.csnotice.dao.QnaBoardIDao;
import com.tech.ibara.csnotice.dto.QnaDto;
import com.tech.ibara.csnotice.dto.QnaImgDto;
import com.tech.ibara.csnotice.dto.QnaReplyDto;
import com.tech.ibara.csnotice.service.CsQnaContentEditService;
import com.tech.ibara.csnotice.service.CsQnaContentService;
import com.tech.ibara.csnotice.service.CsQnaDeleteService;
import com.tech.ibara.csnotice.service.CsQnaEditProcService;
import com.tech.ibara.csnotice.service.CsQnaListService;
import com.tech.ibara.csnotice.service.CsQnaReplyService;
import com.tech.ibara.csnotice.service.CsQnaService;
import com.tech.ibara.csnotice.service.CsQnaWriteService;
import com.tech.ibara.csnotice.vo.SearchVO;

@Controller
public class CsQnaController {

	@Autowired
	private SqlSession sqlSession;
	
	CsQnaService csQnaService;
	
	
	// 리스트 컨트롤러
	@RequestMapping("/qnalist")
	public String qnalist(HttpServletRequest request, SearchVO searchVO, Model model) {
		System.out.println("qnaList()controller");

		model.addAttribute("request",request);
		model.addAttribute("searchVo",searchVO);
		
		csQnaService = new CsQnaListService(sqlSession);
		csQnaService.execute(model);
		
		return "csnotice/qnalist";
	}//qnalist

	
	// 별 기능 없음 writeview로 이동
	@RequestMapping("/qnawriteview")
	public String qnawriteview() {

		return "csnotice/qnawriteview";
	}

	
	// 글 게시 컨트롤러
	@RequestMapping("/qnawrite")
	public String qnawrite(MultipartHttpServletRequest mftrequest, Model model) {
		System.out.println("qnawrite()controller");

		model.addAttribute("mftrequest",mftrequest);
		
		csQnaService = new CsQnaWriteService(sqlSession);
		csQnaService.execute(model);
		
		return "redirect:qnalist";
	}// qnawrite

	
	//게시글 상세페이지
	@RequestMapping("/qnacontent")
	public String qnacontent(HttpServletRequest request, Model model) {
		System.out.println("qnacontent()controller");

		model.addAttribute("request",request);
		
		csQnaService = new CsQnaContentService(sqlSession);
		csQnaService.execute(model);
		
		return "csnotice/qnacontent";
	}// qnacontent
	

	//게시글 수정 페이지
	@RequestMapping("/qnaeditview")
	public String qnacontentedit(HttpServletRequest request, Model model) {
		System.out.println("qnacontentedit()controller");
		
		model.addAttribute("request",request);
		
		csQnaService = new CsQnaContentEditService(sqlSession);
		csQnaService.execute(model);
		
		return "csnotice/qnaeditview";
	}//qnaeditview
	

	// 글 수정 컨트롤러 페이지 전환=list로 감
	@RequestMapping("/qnaeditproc")
	public String qnaeditproc(MultipartHttpServletRequest mftrequest, Model model) {
		System.out.println("qnaeditproc()controller");
		
		model.addAttribute("mftrequest",mftrequest);
		String qbno = mftrequest.getParameter("qbno");
		
		csQnaService = new CsQnaEditProcService(sqlSession);
		csQnaService.execute(model);

		return "redirect:qnacontent?qbno=" + qbno;
	}//qnaeditproc
	
	
	//글 삭제 컨트롤러 페이지 전환=list로 감
	@RequestMapping("/qnadelete")
	public String qnadelete(HttpServletRequest request, Model model) {
		System.out.println("qnadelete()controller");
		
		model.addAttribute("request",request);
		
		csQnaService = new CsQnaDeleteService(sqlSession);
		csQnaService.execute(model);
		
		return "redirect:qnalist";
	}//qnadelete

	
	//글에 대한 답
	@RequestMapping(method = RequestMethod.POST, value = "/qnareply")
	public String qnareply(HttpServletRequest request, Model model) {
		System.out.println("qnareply()");
		
		model.addAttribute("request",request);
		String qbno = request.getParameter("qbno");
		
		csQnaService = new CsQnaReplyService(sqlSession);
		csQnaService.execute(model);
		
		return "redirect:qnacontent?qbno=" + qbno;
	}//qnareply
	
	
//	//답글에 대한 답글 작성하는 컨트롤러
//	@RequestMapping(method = RequestMethod.POST, value = "/qnareply_r")
//	public String qnareply_r(HttpServletRequest request, Model model) throws ClassNotFoundException, SQLException {
//		System.out.println("qnareply()");
//
//		QnaBoardIDao dao = sqlSession.getMapper(QnaBoardIDao.class);
//
//		String nbno = request.getParameter("nbno");
//		String rnbno = request.getParameter("rnbno");
//		String rwriter = request.getParameter("rwriter");
//		String rcontent = request.getParameter("rcontent");
//		String rnbstep = request.getParameter("rnbstep");
//		String rnbgroup = request.getParameter("rnbgroup");
//		String rnbindent = request.getParameter("rnbindent");
//
//		System.out.println("nbno :" + nbno);
//		System.out.println("rnbno :" + rnbno);
//		System.out.println("rwriter :" + rwriter);
//		System.out.println("rcontent :" + rcontent);
//		System.out.println("rnbstep :" + rnbstep);
//		System.out.println("rnbindent :" + rnbindent);
//
//		String sql = "select * from dept";
//		Class.forName("oracle.jdbc.driver.OracleDriver");
//		String url = "jdbc:oracle:thin:@localhost:1521:xe";
//		String user = "hr";
//		String pw = "123456";
//		Connection conn = DriverManager.getConnection(url, user, pw);
//		Statement stmt = conn.createStatement();
//
//		return "redirect:qnacontent?nbno=" + nbno;
//	}//qnareply_r rest 사용 없어도 됨
 
}
