package com.tech.ibara.my.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.my.dao.MyDao;
import com.tech.ibara.my.dto.MyMemberInfoDto;

public class MyPageService implements SService {
	private SqlSession sqlSession;
	private HttpSession session;
	public MyPageService(SqlSession sqlSession,HttpSession session) {
		this.sqlSession=sqlSession;
		this.session=session;
	}
	@Override
	public String execute(Model model) {
		System.out.println("MyPageService");
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		MyMemberInfoDto mdto= (MyMemberInfoDto) session.getAttribute("loginUserDto");
		if(mdto==null) {
			model.addAttribute("msg","로그인정보가없습니다 로그인해주세요");
			return "my/loginform";
		}
		String memtype=mdto.getMemtype();
		System.out.println("loginUser의 memtype은 : "+memtype);
		if(memtype.equals("ADMIN")) {
			return "my/adminmain";
		}else if(memtype.equals("INTERIOR")) {
			return "my/interiormain";
		}else if(memtype.equals("SELLER")) {
			return "my/sellermain";
		}else {
			return "my/mypagemain";
		}
	}
}
