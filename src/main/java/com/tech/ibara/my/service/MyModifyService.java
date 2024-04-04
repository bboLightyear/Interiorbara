package com.tech.ibara.my.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.my.dao.MyDao;
import com.tech.ibara.my.dto.MyMemberInfoDto;

public class MyModifyService implements VService{
	private SqlSession sqlSession;
	private HttpSession session;
	public MyModifyService(SqlSession sqlSession,HttpSession session) {
		this.sqlSession=sqlSession;
		this.session=session;
	}

	@Override
	public void execute(Model model) {
		System.out.println("MyModifyService()");
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
//		session=request.getSession();
		String email=request.getParameter("email");
		String nickname=request.getParameter("nickname");
		String phone=request.getParameter("phone");
		String birth=request.getParameter("birth");
		String gender=request.getParameter("gender");
		System.out.println("email : "+email);
		System.out.println("nickname : "+nickname);
		System.out.println("phone : "+phone);
		System.out.println("birth : "+birth);
		System.out.println("gender : "+gender);
		MyDao mdao=sqlSession.getMapper(MyDao.class);
		int result = mdao.modifyMyMemberInfo(nickname,phone,birth,gender,email);
		
		if(result==1) {
			MyMemberInfoDto memdto=mdao.getMemberInfo("2",nickname);
			session.removeAttribute("loginUserDto");
			session.setAttribute("loginUserDto",memdto);
			model.addAttribute("msg","회원정보가 변경되었습니다.");
		}
	}

}
