package com.tech.ibara.csnotice;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tech.ibara.csnotice.service.CsHomeQnaNoticeService;
import com.tech.ibara.csnotice.service.CsHomeService;
import com.tech.ibara.csnotice.service.CsMailService;



@Controller
public class CsHomeController {

	@Autowired
	private SqlSession sqlSession;
	
	CsHomeService csHomeService;
	
	// 홈에서 고객센터로 이동하는 컨트롤러
	@RequestMapping("/cshome")
	public String cshome(HttpServletRequest request, Model model) {
		System.out.println("cshome()controller");
		
		model.addAttribute("request",request);
		
		csHomeService= new CsHomeQnaNoticeService(sqlSession);
		csHomeService.execute(model);
		
		return "csnotice/cshome";
	}//cshome
	
	@RequestMapping("/mailservice")
	public String emailservice(HttpServletRequest request, Model model) {
		System.out.println("mailservice()controller");
		
		model.addAttribute("request",request);
		
		csHomeService= new CsHomeQnaNoticeService(sqlSession);
		csHomeService.execute(model);
		
		return "csnotice/mailservice";
	}//mailservice
	
	@RequestMapping("/mailsend")
	public String mailsend(HttpServletRequest request, Model model) throws AddressException, MessagingException {
		System.out.println("mailsend()controller");
		
		model.addAttribute("request",request);
		
		csHomeService= new CsMailService();
		csHomeService.execute(model);
		
		return "redirect:cshome";
	}//mailservice
	
	
}
