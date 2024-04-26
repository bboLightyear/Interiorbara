package com.tech.ibara.csnotice.service;

import java.io.File;
import java.util.List;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tech.ibara.csnotice.mail.Gmail;

public class CsMailService implements CsHomeService {

	@Override
	public void execute(Model model) {
	
		Map<String, Object> map=model.asMap();
		MultipartHttpServletRequest mftrequest = null;
		if (map == null) {
		    System.out.println("model.asMap() is null");
		} else {
			mftrequest = (MultipartHttpServletRequest) map.get("mftrequest");
		    if (mftrequest == null) {
		        System.out.println("mftrequest is null");
		    }
		}
		
		
		String to = "bokun0502@gmail.com"; // 받는 사람의 이메일 주소
		String from = "bokun0502@gmail.com"; // 보내는 사람의 이메일 주소
		String host = "smtp.gmail.com"; // 구글 메일 서버 호스트 이름
		
		String subject=mftrequest.getParameter("mailtitle");
		String content=mftrequest.getParameter("mailcontent");
//		String mailfile=mftrequest.getParameter("mailfile");
		List<MultipartFile> mailfile = mftrequest.getFiles("mailfile");
		if (mailfile == null || mailfile.isEmpty()) {
		    System.out.println("No files uploaded");
		} else {
		    // 파일 처리 로직
		}
		String nickname=mftrequest.getParameter("nickname");
		String id=mftrequest.getParameter("id");
		
		System.out.println("mailtitle : "+subject);
		System.out.println("mailcontent : "+content);
		System.out.println("mailfile : "+mailfile);
		System.out.println("nickname : "+nickname);
		System.out.println("id : "+id);
		
		Properties p=new Properties();
		p.put("mail.smtp.user", from);
		p.put("mail.smtp.host", "smtp.googlemail.com");
		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.port", "587");
		
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");
		
		
		String path = "C:\\interiorbara01\\interiorbara01\\src\\main\\webapp\\resources\\upload\\cs\\mail";
		
		String pathFile = null;
		
		if (mailfile != null && !mailfile.isEmpty()) {
			
		// 파일 이름 업로드 당시 밀리초로 변경
		for (MultipartFile mf : mailfile) {
			String originFile = mf.getOriginalFilename();
			System.out.println("파일이름 : " + originFile);
			long longtime = System.currentTimeMillis();
			String changeFile = longtime + "_" + mf.getOriginalFilename();
			System.out.println("변형된 파일 이름 : " + changeFile);
			pathFile = path + "\\" + changeFile;

			// 이미지 없이 글 올릴 경우 filecode 0으로 설정
			if (originFile == "") {
				System.out.println("snbno=-1");
			}
			// 이미지 업로드
			try {
				if (!originFile.equals("")) {
					mf.transferTo(new File(pathFile));
					System.out.println("다중 업로드 성공");
					System.out.println(pathFile);
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		}

		
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
            imagePart.attachFile(pathFile); // 이미지 파일 경로 지정
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
