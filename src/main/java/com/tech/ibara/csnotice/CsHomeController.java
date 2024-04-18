package com.tech.ibara.csnotice;

import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tech.ibara.csnotice.service.CsHomeQnaNoticeService;
import com.tech.ibara.csnotice.service.CsHomeService;
import com.tech.ibara.my.util.Gmail;



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
		
		String to = "bokun0502@gmail.com"; // 받는 사람의 이메일 주소
	    String from = "bokun0502@gmail.com"; // 보내는 사람의 이메일 주소
	    String host = "smtp.gmail.com"; // 구글 메일 서버 호스트 이름
		
	    String subject="test";
		String content="test";

		Properties p=new Properties();
		p.put("mail.smtp.user", from);
		p.put("mail.smtp.host", "smtp.googlemail.com");
		p.put("mail.smtp.port", "465");
//		p.put("mail.smtp.port", "587");
		
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");
		
		try{
			Authenticator auth=new Gmail();
			Session ses=Session.getInstance(p,auth);
			ses.setDebug(true);
			MimeMessage msg=new MimeMessage(ses);
			msg.setSubject(subject);
			Address fromAddr=new InternetAddress(from);
			msg.setFrom(fromAddr);
			Address toAddr=new InternetAddress(to);
			msg.addRecipient(Message.RecipientType.TO, toAddr);
			msg.setContent(content, "text/html;charset=UTF-8");
			Transport.send(msg);
		} catch (Exception e){
			e.printStackTrace();
			System.out.println("실패");
		}
		
		
		return "redirect:cshome";
	}//mailservice
	
	
}
