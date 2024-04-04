package com.tech.ibara.my.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.my.dao.MyDao;
import com.tech.ibara.my.dto.MyMemberInfoDto;
import com.tech.ibara.my.util.CryptoUtil;

public class LoginService implements SService {
	private SqlSession sqlSession;
	public LoginService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}

	@Override
	public String execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String email=request.getParameter("email");
		String pw=request.getParameter("pw");
		System.out.println("email : "+email);
		MyDao mdao=sqlSession.getMapper(MyDao.class);
		MyMemberInfoDto memdto=mdao.getMemberInfo("3",email);
		if(memdto==null) {
			return "emailNull";
		}
		int mailcheck=memdto.getMailcheck();
		String memtype=memdto.getMemtype();
		System.out.println("memtype : "+memtype);
		
		if(mailcheck==0) {
			return "mailcheck error";
		}
		if(memtype.equals("WITHDRAWAL")) {
			return "withdrawal";
		}
		System.out.println("mailcheck : "+mailcheck);
		String shpwd=memdto.getShpwd();
		String bcpwd=memdto.getBcpwd();
		String decpwd="";
		try {
			decpwd= CryptoUtil.decryptAES256(bcpwd,shpwd);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("decpwd : "+decpwd);
		if(decpwd.equals(pw)) {
			return memdto.getNickname();
		}else {
			return "password error";
		}
	}
}
