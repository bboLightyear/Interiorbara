package com.tech.ibara.my.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tech.ibara.my.service.EmailCheckService;
import com.tech.ibara.my.service.JoinService;
import com.tech.ibara.my.service.LoginService;
import com.tech.ibara.my.service.MyModifyService;
import com.tech.ibara.my.service.MyPageService;
import com.tech.ibara.my.service.MyProfileUpdateService;
import com.tech.ibara.my.service.SService;
import com.tech.ibara.my.service.VService;

@Controller
public class MyController {
	SService sservice;
	VService vservice;
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/my/joinform")
	public String joinform(Model model) {
		System.out.println("joinform()");
		return "/my/joinform";
	}
	@RequestMapping("my/join")
	public String join(HttpServletRequest request,Model model) {
		System.out.println("join()");
		model.addAttribute("request",request);
		sservice=new JoinService(sqlSession);
		String str=sservice.execute(model);
		if(str.equals("emaildupl")) {
			model.addAttribute("joinmsg","이미 가입된 이메일입니다");
			return "my/joinform";
		}
		if(str.equals("nndupl")) {
			model.addAttribute("joinmsg","이미 가입된 닉네임입니다");
			return "my/joinform";
		}
		return str;
	}
	@RequestMapping("/emailCheck")
	public String emailCheck(HttpServletRequest request, Model model) {
		model.addAttribute("request",request);
		sservice=new EmailCheckService(sqlSession);
		String str=sservice.execute(model);
		return str;
	}
	@RequestMapping("my/loginform")
	public String loginform(Model model) {
		System.out.println("loginform()");
		return "my/loginform";
	}
	@RequestMapping("my/login")
	public String login(HttpServletRequest request,Model model) {
		System.out.println("login()");
		model.addAttribute("request",request);
		sservice=new LoginService(sqlSession);
		String userNickname=sservice.execute(model);
		if (userNickname.equals("mailcheck error")) {
			model.addAttribute("msg","메일인증후에 다시 로그인 시도해주세요");
			return "my/loginform";
		}else if(userNickname.equals("emailNull")) {
			model.addAttribute("msg","가입되지 않은 메일주소입니다.");
			return "my/loginform";
		}else if (userNickname.equals("pessword error")){
			model.addAttribute("msg","비밀번호를 다시 입력해주세요.");
			return "my/loginform";
		}
		HttpSession session=request.getSession();
		session.setAttribute("sessionNickname", userNickname);
		return "redirect:/main";
	}
	@RequestMapping("main")
	public String main() {
		System.out.println("main()");
		return "main";
	}
	@RequestMapping("my/logout")
	public String logout(HttpServletRequest request) {
		System.out.println("logout()");
		HttpSession session=request.getSession();
		session.invalidate();		
		return "redirect:/main";
	}
	@RequestMapping("my/mypagemain")
	public String mypagemain(HttpServletRequest request,Model model) {
		System.out.println("mypagemain()");
		model.addAttribute("request", request);
		vservice =new MyPageService(sqlSession);
		vservice.execute(model);
		return "my/mypagemain";
	}
	@RequestMapping("my/mypageinfoedit")
	public String mypageinfoedit(HttpServletRequest request,Model model) {
		System.out.println("mypageinfoedit()");
		model.addAttribute("request",request);
		vservice =new MyPageService(sqlSession);
		vservice.execute(model);		
		return "my/mypageinfoedit";
	}
	@RequestMapping("my/profile")
	public String updateprofile(HttpServletRequest request,Model model) {
		System.out.println("updateprofile()");
		model.addAttribute("request",request);
		vservice =new MyProfileUpdateService(sqlSession);
		vservice.execute(model);
		return "redirect:mypagemain";
	}
	@RequestMapping(method=RequestMethod.POST,value="/modify")
	public String modify(HttpServletRequest request,Model model) {
		System.out.println("modify()");
		model.addAttribute("request",request);
		vservice =new MyModifyService(sqlSession);
		vservice.execute(model);
		return "";
	}
	
	
	@RequestMapping("my/nonmember")
	public String nonmember() {
		System.out.println("nonmember()");
		return "my/nonmember";
	}
	
	@RequestMapping("my/nonmemberEstimateSearch")
	public String nonmemberEstimateSearch(HttpServletRequest request,Model model) {
		System.out.println("nonmemberEstimateSearch()");
		return "my/nonmemberEstimateSearch";
	}
	@RequestMapping("my/nonmemberOrderSearch")
	public String nonmemberOrderSearch(HttpServletRequest request,Model model) {
		System.out.println("nonmemberOrderSearch()");
		return "my/nonmemberOrderSearch";
	}
	
	
	
	
	
	
}
