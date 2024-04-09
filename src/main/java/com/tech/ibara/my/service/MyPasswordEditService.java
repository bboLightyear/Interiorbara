package com.tech.ibara.my.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.my.dao.MyDao;
import com.tech.ibara.my.dto.MyMemberInfoDto;
import com.tech.ibara.my.util.CryptoUtil;

public class MyPasswordEditService implements SService{
	private SqlSession sqlSession;
	
	public MyPasswordEditService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	@Override
	public String execute(Model model) {
		System.out.println("MyPasswordEditService()");
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		String nickname=request.getParameter("nickname");
		String pw=request.getParameter("pw1");

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
