package com.tech.ibara.my.service;

import java.util.Map;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.my.dao.MyDao;
import com.tech.ibara.my.util.EmailSHA;
import com.tech.ibara.my.util.Gmail;

public class PassResetService implements VService {
	private SqlSession sqlSession;

	public PassResetService(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void execute(Model model) {
		System.out.println("PassResetService()");
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String email = request.getParameter("email");

		MyDao mdao = sqlSession.getMapper(MyDao.class);
		int emailCheckResult=mdao.countCheck("3",email);
		if(emailCheckResult==0) {
			model.addAttribute("msg","가입되지않은 이메일입니다.");
		}else {
			String nickname = mdao.getMemberNickname(email);
			emailSendAction(nickname);
			model.addAttribute("msg","비밀번호 변경을 위해 이메일인증을 해주세요");
		}
	}

	private void emailSendAction(String nickname) {

		MyDao mdao = sqlSession.getMapper(MyDao.class);
		String host = "http://localhost:9024/ibara/";
		String from = "amine1225@gmail.com";
		String to = mdao.getMemberEmail(nickname);
		String code = new EmailSHA().getSHA256(to);
		String subject = "비밀번호변경을 위한 이메일인증 메일입니다.";
		String content = "다음 링크 클릭 이메일 인증을 진행하세요." + "<a href='" + host + "my/passMailCheck?code=" + code + "&nickname="	+ nickname + "'><b>이메일 인증하기</b></a>";

		Properties p = new Properties();
		p.put("mail.smtp.user", from);
		p.put("mail.smtp.host", "smtp.googlemail.com");
		p.put("mail.smtp.port", "465");
//		      p.put("mail.smtp.port", "587");

		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");

		try {
			Authenticator auth = new Gmail();
			Session ses = Session.getInstance(p, auth);
			ses.setDebug(true);
			MimeMessage msg = new MimeMessage(ses);
			msg.setSubject(subject);
			Address fromAddr = new InternetAddress(from);
			msg.setFrom(fromAddr);
			Address toAddr = new InternetAddress(to);
			msg.addRecipient(Message.RecipientType.TO, toAddr);
			msg.setContent(content, "text/html;charset=UTF-8");
			Transport.send(msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
