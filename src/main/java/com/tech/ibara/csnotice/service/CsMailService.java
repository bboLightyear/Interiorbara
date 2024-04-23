package com.tech.ibara.csnotice.service;

import java.util.Map;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.tech.ibara.csnotice.mail.Gmail;

public class CsMailService implements CsHomeService {

	@Override
	public void execute(Model model) {
	
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		String to = "bokun0502@gmail.com"; // 받는 사람의 이메일 주소
		String from = "bokun0502@gmail.com"; // 보내는 사람의 이메일 주소
		String host = "smtp.gmail.com"; // 구글 메일 서버 호스트 이름
		
		String subject=request.getParameter("mailtitle");
		String content=request.getParameter("mailcontent");
		String mailfile=request.getParameter("mailfile");
		String nickname=request.getParameter("nickname");
		String id=request.getParameter("id");
		
		System.out.println("mailtitle : "+subject);
		System.out.println("mailcontent : "+content);
		System.out.println("mailfile : "+mailfile);
		System.out.println("nickname : "+nickname);
		System.out.println("id : "+id);
		
		Properties p=new Properties();
		p.put("mail.smtp.user", from);
		p.put("mail.smtp.host", "smtp.googlemail.com");
		p.put("mail.smtp.port", "465");
//	p.put("mail.smtp.port", "587");
		
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");
		
		try {
            Authenticator auth = new Gmail(from);
            Session ses = Session.getInstance(p, auth);
            ses.setDebug(true);
            MimeMessage msg = new MimeMessage(ses);
            msg.setSubject(subject);
            Address fromAddr = new InternetAddress(from, id);
            msg.setFrom(fromAddr);
            Address toAddr = new InternetAddress(to);
            msg.addRecipient(Message.RecipientType.TO, toAddr);

            // Create a multipart message for attachment
            Multipart multipart = new MimeMultipart();

            // Create a message part to add content
            MimeBodyPart messageBodyPart = new MimeBodyPart();
            messageBodyPart.setContent(content, "text/html;charset=UTF-8");
            multipart.addBodyPart(messageBodyPart);

            // Second part (the image)
            MimeBodyPart imagePart = new MimeBodyPart();
            imagePart.attachFile("C:\\23setspring\\springwork23\\interiorbara\\src\\main\\webapp\\resources\\img\\csimg\\아래화살표.png"); // 이미지 파일 경로 지정
            imagePart.setContentID("<image>");
            imagePart.setDisposition(MimeBodyPart.INLINE);

            // Add the image part to the multipart
            multipart.addBodyPart(imagePart);

            // Set the complete message parts
            msg.setContent(multipart);

            // Send the message
            Transport.send(msg);
            System.out.println("이메일 발송 성공!");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("이메일 발송 실패");
        }
	}
	
	
}
