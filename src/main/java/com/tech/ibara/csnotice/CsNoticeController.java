package com.tech.ibara.csnotice;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tech.ibara.csnotice.service.notice.CsNoticeContentEditService;
import com.tech.ibara.csnotice.service.notice.CsNoticeContentService;
import com.tech.ibara.csnotice.service.notice.CsNoticeDeleteService;
import com.tech.ibara.csnotice.service.notice.CsNoticeEditProcService;
import com.tech.ibara.csnotice.service.notice.CsNoticeListService;
import com.tech.ibara.csnotice.service.notice.CsNoticeReplyService;
import com.tech.ibara.csnotice.service.notice.CsNoticeService;
import com.tech.ibara.csnotice.service.notice.CsNoticeWriteService;
import com.tech.ibara.csnotice.vo.SearchVO;

@Controller
public class CsNoticeController {
	
	@Autowired
	private SqlSession sqlSession;
	
	CsNoticeService csNoticeService;
	
	
	// 리스트 컨트롤러
	@RequestMapping("/noticelist")
	public String noticelist(HttpServletRequest request, SearchVO searchVO, Model model) {
		System.out.println("noticeList()controller");

		model.addAttribute("request",request);
		model.addAttribute("searchVo",searchVO);
		
		csNoticeService = new CsNoticeListService(sqlSession);
		csNoticeService.execute(model);
		
		return "csnotice/noticelist";
	}
	
	
	// 별 기능 없음 writeview로 이동
	@RequestMapping("/noticewriteview")
	public String noticewriteview() {

		return "csnotice/noticewriteview";
	}
	
	
	// 글 게시 컨트롤러
	@RequestMapping("/noticewrite")
	public String noticewrite(MultipartHttpServletRequest mftrequest, Model model) {
		System.out.println("qnawrite()controller");

		model.addAttribute("mftrequest",mftrequest);
		
		csNoticeService = new CsNoticeWriteService(sqlSession);
		csNoticeService.execute(model);
		
		return "redirect:noticelist";
	}// qnawrite
	
	
	//게시글 상세페이지
	@RequestMapping("/noticecontent")
	public String noticecontent(HttpServletRequest request, Model model) {
		System.out.println("qnacontent()controller");

		model.addAttribute("request",request);
		
		csNoticeService = new CsNoticeContentService(sqlSession);
		csNoticeService.execute(model);
		
		return "csnotice/noticecontent";
	}// qnacontent
	
	
	//글에 대한 답
	@RequestMapping(method = RequestMethod.POST, value = "/noticereply")
	public String noticereply(HttpServletRequest request, Model model) {
		System.out.println("noticereply()");
		
		model.addAttribute("request",request);
		String nbno = request.getParameter("nbno");
		
		csNoticeService = new CsNoticeReplyService(sqlSession);
		csNoticeService.execute(model);
		
		return "redirect:noticecontent?nbno=" + nbno;
	}//qnareply
	
	
	//게시글 수정 페이지
	@RequestMapping("/noticeeditview")
	public String noticecontentedit(HttpServletRequest request, Model model) {
		System.out.println("noticecontentedit()controller");
		
		model.addAttribute("request",request);
		
		csNoticeService = new CsNoticeContentEditService(sqlSession);
		csNoticeService.execute(model);
		
		return "csnotice/noticeeditview";
	}//qnaeditview
	
	
	// 글 수정 컨트롤러 페이지 전환=list로 감
	@RequestMapping("/noticeeditproc")
	public String noticeeditproc(MultipartHttpServletRequest mftrequest, Model model) {
		System.out.println("noticeeditproc()controller");
		
		model.addAttribute("mftrequest",mftrequest);
		String nbno = mftrequest.getParameter("nbno");
		
		csNoticeService = new CsNoticeEditProcService(sqlSession);
		csNoticeService.execute(model);

		return "redirect:noticecontent?nbno=" + nbno;
	}//qnaeditproc
	
	
	//글 삭제 컨트롤러 페이지 전환=list로 감
	@RequestMapping("/noticedelete")
	public String noticedelete(HttpServletRequest request, Model model) {
		System.out.println("noticedelete()controller");
		
		model.addAttribute("request",request);
		
		csNoticeService = new CsNoticeDeleteService(sqlSession);
		csNoticeService.execute(model);
		
		return "redirect:noticelist";
	}//qnadelete
}
