package com.tech.ibara.my.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.my.dto.MyMemberInfoDto;
import com.tech.ibara.my.util.CryptoUtil;

public class MyPasswordService implements SService{
	private SqlSession sqlSession;
	private HttpSession session;
	public MyPasswordService(SqlSession sqlSession,HttpSession session) {
		this.sqlSession=sqlSession;
		this.session=session;
		
	}
	@Override
	public String execute(Model model) {
		System.out.println("MyPasswordService()");
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
//		session=request.getSession();
		MyMemberInfoDto memdto = (MyMemberInfoDto) session.getAttribute("loginUserDto");
		if(memdto==null) {
			return "not login";
		}
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
		model.addAttribute("mypwd",decpwd);
		return "login";
	}
}
