package com.tech.ibara.my.service;

import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.my.dao.MyDao;
import com.tech.ibara.my.dto.MyMemberInfoDto;

public class MyModifyService implements SService{
	private SqlSession sqlSession;
	private HttpSession session;
	public MyModifyService(SqlSession sqlSession,HttpSession session) {
		this.sqlSession=sqlSession;
		this.session=session;
	}

	@Override
	public String execute(Model model) {
		System.out.println("MyModifyService()");
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
//		String memtype=(String) map.get("memtype");
//		System.out.println("memtype : "+memtype );
//		session=request.getSession();
		String memno=request.getParameter("memno");
		String email=request.getParameter("email");
		String nickname=request.getParameter("nickname");
		String phone=request.getParameter("phone");
		String birth=request.getParameter("birth");
		String gender=request.getParameter("gender");
		System.out.println("memno : "+memno);
		System.out.println("email : "+email);
		System.out.println("nickname : "+nickname);
		System.out.println("phone : "+phone);
		System.out.println("birth : "+birth);
		System.out.println("gender : "+gender);
				
		boolean nnbool=Pattern.matches("^(?=.*[a-z0-9가-힣])[a-z0-9ㄱ-힣]{2,15}$", nickname);
		boolean phonebool=Pattern.matches("^(010)-?[0-9]{3,4}-?[0-9]{4}$", phone);
		boolean birthbool=Pattern.matches("^(19|20)\\d{2}(0[1-9]|1[0-2])(0[1-9]|[12]\\d|3[01])$", birth);
		if(!nnbool || nickname.equals("admin")|| nickname.equals("비공개")) {
			return "nn check";
		}
		
		if(phone.length()!=0) {
			if(!phonebool) {
				return "phone check";			
			}
		}
		if(birth.length()!=0) {
			if(!birthbool) {
				return "birth check";
			}
		}				
		
		MyDao mdao=sqlSession.getMapper(MyDao.class);
		String mynickname = mdao.getMemberNickname(email);
			
		if(!mynickname.equals(nickname)) {
			int nnCheckResult=mdao.countCheck("2",nickname);
			if(nnCheckResult!=0) {
				return "nndupl";
			}
		}
		int result=0;
		if(!mynickname.equals("admin")) {
			result = mdao.modifyMyMemberInfo(nickname,phone,birth,gender,email);
		}else {
			result = mdao.modifyMyMemberInfo("admin",phone,birth,gender,email);
		}
		String memtype=mdao.getMemtype(memno);	
		MyMemberInfoDto memdto;
		int intmemno=Integer.parseInt(memno);
		if(result==1) {
			if(memtype.equals("INTERIOR")) {
				memdto=mdao.getInteriorMember(intmemno);
			}else if(memtype.equals("SELLER")) {
				memdto=mdao.getSellerMember(intmemno);
			}else {			
				memdto=mdao.getMemberInfo("3",email);
			}
			session.removeAttribute("loginUserDto");
			session.setAttribute("loginUserDto",memdto);
			return "modify";
		}else {
			return "modify error";
		}
	}
}
