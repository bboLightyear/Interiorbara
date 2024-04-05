package com.tech.ibara.my.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.my.dao.MyDao;
import com.tech.ibara.my.dto.MyMemberInfoDto;

public class SignUpService implements SService{
	private SqlSession sqlSession;
	private HttpSession session;
	public SignUpService (SqlSession sqlSession,HttpSession session) {
		this.sqlSession=sqlSession;
		this.session=session;
	}
	@Override
	public String execute(Model model) {
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
//		session=request.getSession();
		String memno=request.getParameter("memno");				
		String memtype=request.getParameter("memtype");				
		String interiorNum=request.getParameter("interior");
		String sellerNum=request.getParameter("seller");
		System.out.println("memno : "+memno);
		System.out.println("memtype : "+memtype);
		System.out.println("interiorNum : "+interiorNum);
		System.out.println("sellerNum : "+sellerNum);
		//프로젝트이기에 숫자10개 인지만 확인하고 자세한 유효성검사를 진행하지 않습니다.
		if(memno.equals("")) {
			return "memno null";
		}				
		if(memtype.equals("INTERIOR")) {
			return "memtype interior error";
		}else if(memtype.equals("SELLER")) {
			return "memtype seller error";
		}else if(memtype.equals("WITHDRAWAL")) {
			return "memtype withdrawal error";
		}else if(memtype.endsWith("ADMIN")) {
			return "memtype admin error";
		}
		
		if(interiorNum.length()==0 && sellerNum.length()==0) {
			return "number null";
		}
		if(interiorNum.length()==10 && sellerNum.length()==10) {
			return "number choice error";
		}
		if(sellerNum.length()==0 && interiorNum.length()!=10) {
			return "interior error number length";
		}
		if(interiorNum.length()==0 && sellerNum.length()!=10) {
			return "seller error number length";
		}
		
		
		MyDao mdao=sqlSession.getMapper(MyDao.class);
	
		if(sellerNum.length()==0 && interiorNum.length()==10) {
			int interiorCount=mdao.countCheckInterior(interiorNum);
			int sellerCount=mdao.countCheckSeller(interiorNum);
			if(interiorCount==0 && sellerCount==0) {
				int interiorResult=mdao.insertInterior(memno, interiorNum);
				if(interiorResult==1) {
					mdao.completedInterior(memno);
					MyMemberInfoDto memdto=mdao.getMemberInfo("1",memno);
					session.removeAttribute("loginUserDto");
					session.setAttribute("loginUserDto",memdto);
					return "interior";
				}				
			}else if(interiorCount==0 && sellerCount==1) {
				return "interior error seller dupl";
			}else if (interiorCount==1 && sellerCount==0) {
				return "interior dupl";
			}
		}
		
		if(interiorNum.length()==0 && sellerNum.length()==10 ) {
			int interiorCount=mdao.countCheckInterior(sellerNum);
			int sellerCount=mdao.countCheckSeller(sellerNum);
			if(sellerCount==0 && interiorCount==0) {
				int sellResult=mdao.insertSeller(memno, sellerNum);
				if(sellResult==1) {
					mdao.completedSeller(memno);
					MyMemberInfoDto memdto=mdao.getMemberInfo("1",memno);
					session.removeAttribute("loginUserDto");
					session.setAttribute("loginUserDto",memdto);
					return "seller";
				}				
			}else if (sellerCount==0 && interiorCount==1) {
				return "seller error interior dupl";
			}else if (sellerCount==1 && interiorCount==0) {
				return "seller dupl";
			}
		}
		return "error";
	}
	

}
