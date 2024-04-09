package com.tech.ibara.my.service;

import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.my.dao.MyDao;
import com.tech.ibara.my.dto.MyMemberInfoDto;
import com.tech.ibara.my.util.CryptoUtil;

public class MyPasswordMCEditService implements SService{
	private SqlSession sqlSession;
	
	public MyPasswordMCEditService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	@Override
	public String execute(Model model) {
		System.out.println("MyPasswordEditService()");
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		String nickname=request.getParameter("nickname");
		String pw=request.getParameter("pw1");
		String pw2=request.getParameter("pw2");
		boolean pwbool=Pattern.matches("^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&])[A-Za-z\\d$@$!%*#?&]{8,}$", pw);
	
		if(!pwbool) {
	    	return "pw check";
	    }else if(!pw.equals(pw2)) {
	    	  return "pw not match";    	  
	    }   
		String shpwd="";
		String bcpwd="";
		try {
			shpwd = CryptoUtil.sha512(pw);
			bcpwd = CryptoUtil.encryptAES256(pw, shpwd);	         
	    } catch (Exception e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	    }
		MyDao mdao=sqlSession.getMapper(MyDao.class);
		int updateResult=mdao.updatePassword(shpwd,bcpwd,nickname);
		if(updateResult==1) {
			return "password reset success";
		}else {		
			return "reset error";
		}
	}
}
