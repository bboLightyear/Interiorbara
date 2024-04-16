package com.tech.ibara.my.service;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.tech.ibara.my.dto.MyMemberInfoDto;

public class MyPageService implements SService {
	private HttpSession session;
	public MyPageService(HttpSession session) {
		this.session=session;
	}
	@Override
	public String execute(Model model) {
		System.out.println("MyPageService");
		MyMemberInfoDto mdto= (MyMemberInfoDto) session.getAttribute("loginUserDto");
		String nickname=mdto.getNickname();
		System.out.println("로그인유저닉넴 : "+nickname);
		String memtype=mdto.getMemtype();
		System.out.println("loginUser의 memtype은 : "+memtype);
		if(mdto==null) {
			return "not login";
		}else if(memtype.equals("ADMIN")) {
			return "admin";
		}else if(memtype.equals("INTERIOR")) {
			return "interior";
		}else if(memtype.equals("SELLER")) {
			return "seller";
		}else {
			return "person";
		}
	}
}
