package com.tech.ibara.csnotice;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tech.ibara.csnotice.service.qna.CsQnaContentEditService;
import com.tech.ibara.csnotice.service.qna.CsQnaContentService;
import com.tech.ibara.csnotice.service.qna.CsQnaDeleteService;
import com.tech.ibara.csnotice.service.qna.CsQnaEditProcService;
import com.tech.ibara.csnotice.service.qna.CsQnaListService;
import com.tech.ibara.csnotice.service.qna.CsQnaReplyService;
import com.tech.ibara.csnotice.service.qna.CsQnaService;
import com.tech.ibara.csnotice.service.qna.CsQnaWriteService;
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
}