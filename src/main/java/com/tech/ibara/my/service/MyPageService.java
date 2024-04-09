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
