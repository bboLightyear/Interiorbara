package com.tech.ibara.my.service;

import java.sql.Connection;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.regex.Pattern;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.cursor.Cursor;
import org.apache.ibatis.executor.BatchResult;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.tech.ibara.my.dao.MyDao;
import com.tech.ibara.my.util.CryptoUtil;
import com.tech.ibara.my.util.EmailSHA;
import com.tech.ibara.my.util.Gmail;

public class JoinService implements SService {
	
	private SqlSession sqlSession;
	public JoinService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
			      
   @Override
   public String execute(Model model) {
      Map<String, Object> map=model.asMap();
      HttpServletRequest request=(HttpServletRequest) map.get("request");
      String user_email=request.getParameter("user_email");
      String email_address=request.getParameter("email_address");
      String pw=request.getParameter("pw1");
      String pw2=request.getParameter("pw2");
      String nickname=request.getParameter("nickname");
      String email=user_email+"@"+email_address;
      System.out.println("email : "+email);
      System.out.println("pw1 : "+pw);
      System.out.println("nickname : "+nickname);
      
      boolean nnbool=Pattern.matches("^(?=.*[a-z0-9가-힣])[a-z0-9ㄱ-힣]{2,15}$", nickname);
      System.out.println("nnbool : "+nnbool);
      if(!nnbool || nickname.equals("admin")|| nickname.equals("비공개")) {
    	  return "nn check";
      }
      
      if(!pw.equals(pw2)) {
    	  return "pw not match";
      }else {
    	  boolean pwbool=Pattern.matches("^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$", pw);
    	  if(!pwbool) {
    		  return "pw check";
    	  }
      }

      String shpwd="";
      String bcpwd="";
      //암호화 처리
      try {
//         SHA256 sha=SHA256.getInsatnce();
//         shpwd = sha.getSha256(pw.getBytes());
         shpwd = CryptoUtil.sha512(pw);
         
//         bcpwd = BCrypt.hashpw(shpwd, BCrypt.gensalt());
         bcpwd = CryptoUtil.encryptAES256(pw, shpwd);
         
         
      } catch (Exception e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
    
      MyDao mdao=sqlSession.getMapper(MyDao.class);
      int emailCheckResult=mdao.countCheck("3",email);
      int nnCheckResult=mdao.countCheck("2",nickname);

      System.out.println("emailCheckResult = "+emailCheckResult);
      System.out.println("nnCheckResult = "+nnCheckResult);
      if(emailCheckResult==0 && nnCheckResult==0) {//가입 가능할 때
    	  mdao.join(nickname,shpwd,bcpwd,email);
    	  emailSendAction(nickname);
    	  return "success";//가입 성공
      }else if(emailCheckResult==1) {//이미 가입한 email, 가입 불가
    	  return "emaildupl";
      }else if(nnCheckResult==1) {//이미 존재하는 닉네임, 가입 불가
    	  return "nndupl";
      }else {
    	  return "error";
      }
      
         
	}    
   
   private void emailSendAction(String nickname) {
	    
	  MyDao mdao=sqlSession.getMapper(MyDao.class);
      String host="http://localhost:9024/ibara/";
      String from="amine1225@gmail.com";
      String to=mdao.getMemberEmail(nickname);
      String code=new EmailSHA().getSHA256(to);
      String subject="회원가입 인증을 위한 메일입니다.";
      String content="다음 링크 클릭 이메일 인증을 진행하세요."+"<a href='"+host+"emailCheck?code="+code+"&nickname="+nickname+"'><b>이메일 인증하기</b></a>";
      
      
      Properties p=new Properties();
      p.put("mail.smtp.user", from);
      p.put("mail.smtp.host", "smtp.googlemail.com");
      p.put("mail.smtp.port", "465");
//      p.put("mail.smtp.port", "587");
      
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
      }
   }
}