package com.tech.ibara.csnotice;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tech.ibara.csnotice.service.CsNoticeListService;
import com.tech.ibara.csnotice.service.CsNoticeService;
import com.tech.ibara.csnotice.service.CsNoticeWriteService;
import com.tech.ibara.csnotice.service.CsQnaListService;
import com.tech.ibara.csnotice.service.CsQnaWriteService;
import com.tech.ibara.csnotice.vo.SearchVO;

@Controller
public class CsNoticeController {
	
	@Autowired
	private SqlSession sqlSession;
	
	CsNoticeService csNoticeService;
	
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
	
}
