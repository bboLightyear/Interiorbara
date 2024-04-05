package com.tech.ibara.my.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tech.ibara.my.dao.MyDao;
import com.tech.ibara.my.dto.MyMemberInfoDto;
import com.tech.ibara.my.service.AllowCheckWithdrawalService;
import com.tech.ibara.my.service.CancelWithdrawalService;
import com.tech.ibara.my.service.DemandWithdrawalInsertService;
import com.tech.ibara.my.service.DemandWithdrawalMemberService;
import com.tech.ibara.my.service.EmailCheckService;
import com.tech.ibara.my.service.JoinService;
import com.tech.ibara.my.service.LoginService;
import com.tech.ibara.my.service.MemberListService;
import com.tech.ibara.my.service.MyModifyService;
import com.tech.ibara.my.service.MyPasswordEditService;
import com.tech.ibara.my.service.MyPasswordService;
import com.tech.ibara.my.service.MyProfileUpdateService;
import com.tech.ibara.my.service.PassResetService;
import com.tech.ibara.my.service.SService;
import com.tech.ibara.my.service.SignUpService;
import com.tech.ibara.my.service.VService;

@Controller
public class MyController {
	SService sservice;
	VService vservice;
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private HttpSession session;
	
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
		System.out.println("return msg : "+userNickname);
		if (userNickname.equals("mailcheck error")) {
			model.addAttribute("msg","메일인증후에 다시 로그인 시도해주세요");
			return "my/loginform";
		}else if(userNickname.equals("emailNull")) {
			model.addAttribute("msg","가입되지 않은 메일주소입니다.");
			return "my/loginform";
		}else if (userNickname.equals("password error")){
			model.addAttribute("msg","비밀번호를 다시 입력해주세요.");
			return "my/loginform";
		}else if(userNickname.equals("withdrawal")) {
			model.addAttribute("msg","탈퇴한 회원의 메일로 로그인을 시도하셨습니다.");
			return "my/loginform";
		}
		MyDao mdao=sqlSession.getMapper(MyDao.class);
		MyMemberInfoDto memdto2=mdao.getMemberInfo("2",userNickname);
		session=request.getSession();
//		session.setAttribute("sessionNickname", userNickname);
		session.setAttribute("loginUserDto",memdto2 );
		return "redirect:/";
	}
	@RequestMapping("my/adminmain")
	public String adminmain(HttpServletRequest request,Model model) {
		System.out.println("adminmain()");
		return "my/adminmain";
	}
	
//	@RequestMapping("main/main")
//	public String main() {
//		System.out.println("main()");
//		return "main/main";
//	}
	@RequestMapping("my/logout")
	public String logout(HttpServletRequest request) {
		System.out.println("logout()");
//		session=request.getSession();
		session.invalidate();
		return "redirect:/";
	}
	@RequestMapping("my/mypagemain")
	public String mypagemain(HttpServletRequest request,Model model) {
		System.out.println("mypagemain()");
		return "my/mypagemain";
	}
	@RequestMapping("my/mypageinfoedit")
	public String mypageinfoedit(HttpServletRequest request,Model model) {
		System.out.println("mypageinfoedit()");
		return "my/mypageinfoedit";
	}
	@RequestMapping("my/profile")
	public String updateprofile(HttpServletRequest request,Model model) {
		System.out.println("updateprofile()");
		model.addAttribute("request",request);
		vservice =new MyProfileUpdateService(sqlSession,session);
		vservice.execute(model);
		return "my/mypageinfoedit";
	}
	@RequestMapping(method=RequestMethod.POST,value="my/modify")
	public String modify(HttpServletRequest request,Model model) {
		System.out.println("modify()");
		model.addAttribute("request",request);
		vservice =new MyModifyService(sqlSession,session);
		vservice.execute(model);
		return "my/mypageinfoedit";
	}
	@RequestMapping("my/mypagepasswordedit")
	public String mypagepasswordedit(HttpServletRequest request,Model model) {
		System.out.println("mypagepasswordedit()");
		model.addAttribute("request",request);
		sservice=new MyPasswordService(sqlSession,session);
		String str=sservice.execute(model);
		if(str.equals("not login")) {
			model.addAttribute("msg","로그인정보가 없습니다. 로그인해주세요");
			return "my/loginform";
		}else {
			return "my/mypagepasswordedit";
		}
	}
	@RequestMapping(method=RequestMethod.POST,value="my/passedit")
	public String passedit(HttpServletRequest request,Model model) {
		System.out.println("passedit()");
		model.addAttribute("request",request);
		sservice =new MyPasswordEditService(sqlSession);
		String str=sservice.execute(model);
		if(str.equals("password reset success")) {
			session.invalidate();
			model.addAttribute("msg","비밀번호가 변경되었습니다. 다시 로그인해주세요");
			return "my/loginform";
		}else {
			model.addAttribute("msg","비밀번호 변경 오류");
			return "my/mypagepasswordedit";	
		}		
	}	
	
	@RequestMapping("my/passwordReset")
	public String passwordReset(HttpServletRequest request,Model model) {
		System.out.println("passwordReset()");
		return "my/passwordReset";
	}
	
	@RequestMapping("my/passReset")
	public String passReset(HttpServletRequest request,Model model) {
		System.out.println("passReset()");
		model.addAttribute("request",request);
		sservice=new PassResetService(sqlSession);
		String str = sservice.execute(model);
		if(str.equals("emailNull")) {
			model.addAttribute("msg","가입되지않은 이메일입니다.");
			return "my/passwordReset";
		}else {
		return str;
		}
	}
	@RequestMapping("my/passMailCheck")
	public String passMailCheck(HttpServletRequest request,Model model) {
		model.addAttribute("request",request);
		sservice=new EmailCheckService(sqlSession);
		String MC=sservice.execute(model);
		if(MC.equals("emailCheck error")) {
			model.addAttribute("msg","메일인증오류");
			return "my/passwordReset";
		}		
		return MC;
	}
	@RequestMapping(method=RequestMethod.POST,value="my/passeditMC")
	public String passeditMC(HttpServletRequest request,Model model) {
		System.out.println("passeditMC()");
		model.addAttribute("request",request);
		sservice =new MyPasswordEditService(sqlSession);
		String str=sservice.execute(model);
		if(str.equals("password reset success")) {
			session.invalidate();
			model.addAttribute("msg","비밀번호가 변경되었습니다. 다시 로그인해주세요");
			return "my/loginform";
		}else {
			model.addAttribute("msg","비밀번호 변경 오류");
			return "my/passwordReset";
		}		
	}
	
//	@RequestMapping("my/nonmember")
//	public String nonmember() {
//		System.out.println("nonmember()");
//		return "my/nonmember";
//	}	
//	@RequestMapping("my/nonmemberEstimateSearch")
//	public String nonmemberEstimateSearch(HttpServletRequest request,Model model) {
//		System.out.println("nonmemberEstimateSearch()");
//		return "my/nonmemberEstimateSearch";
//	}
//	@RequestMapping("my/nonmemberOrderSearch")
//	public String nonmemberOrderSearch(HttpServletRequest request,Model model) {
//		System.out.println("nonmemberOrderSearch()");
//		return "my/nonmemberOrderSearch";
//	}
	@RequestMapping("my/withdrawal")
	public String withdrawal(HttpServletRequest request,Model model) {
		System.out.println("withdrawal()");
		
		return "my/withdrawal";
	}
	@RequestMapping(method=RequestMethod.POST, value="my/demandwithdrawal")
	public String demandwithdrawal(HttpServletRequest request,Model model) {
		System.out.println("demandwithdrawal()");
		model.addAttribute("request",request);
		vservice=new DemandWithdrawalInsertService(sqlSession);
		vservice.execute(model);
		return "my/withdrawal";
	}
	@RequestMapping("my/cancelwithdrawal")
	public String cancelwithdrawal(HttpServletRequest request,Model model) {
		System.out.println("cancelwithdrawal()");
		model.addAttribute("request",request);
		vservice=new CancelWithdrawalService(sqlSession);
		vservice.execute(model);		
		return "my/withdrawal";
	}
	
	@RequestMapping("my/mypagecompanysignup")
	public String mypagecompanysignup() {
		System.out.println("mypagecompanysignup()");
		return "my/mypagecompanysignup";
	}	
	@RequestMapping(method=RequestMethod.POST, value="my/signUp")
	public String signUp(HttpServletRequest request,Model model) {
		System.out.println("signUp()");
		model.addAttribute("request",request);
		sservice = new SignUpService(sqlSession,session);
		String str=sservice.execute(model);
		System.out.println("return msg : "+str);
		if(str.equals("error")) {
			model.addAttribute("errorMsg","ERROR : 분류할수 없는 에러");
		}else if(str.equals("memno null")) {
			model.addAttribute("errorMsg","ERROR : 멤버정보가 없습니다.");
		}else if(str.equals("memtype interior error")) {
			model.addAttribute("errorMsg","ERROR : 이미 인테리어 업체로 등록된 회원입니다.");
		}else if(str.equals("memtype seller error")) {
			model.addAttribute("errorMsg","ERROR : 이미 판매자로 등록된 회원입니다.");
		}else if(str.equals("memtype withdrawal error")) {
			model.addAttribute("errorMsg","ERROR : 탈퇴한 회원입니다.");
		}else if(str.equals("memtype admin error")) {
			model.addAttribute("errorMsg","ERROR : 관리자는 업체등록을 할 수 없습니다.");
		}else if (str.equals("number null")) {
			model.addAttribute("errorMsg","업체등록을 하시려면 사업자등록번호를 입력해주세요");
		}else if(str.equals("number choice error")) {
			model.addAttribute("errorMsg","둘다 등록할 수는 없습니다. 한가지만 등록해주세요");
		}else if(str.equals("interior error number length")) {
			model.addAttribute("inteResultMsg","10자리 숫자만 입력해주세요");
		}else if(str.equals("seller error number length")) {
			model.addAttribute("sellerResultMsg","10자리 숫자만 입력해주세요");
		}else if(str.equals("interior")) {
			model.addAttribute("inteResultMsg","인테리어 업체로 등록되었습니다.");
		}else if(str.equals("interior error seller dupl")) {
			model.addAttribute("inteResultMsg","ERROR : 판매업체로 등록된 사업자번호입니다.");
		}else if(str.equals("interior dupl")) {
			model.addAttribute("inteResultMsg","ERROR : 이미 인테리어 업체로 등록된 사업자번호입니다.");
		}else if(str.equals("seller")) {
			model.addAttribute("sellerResultMsg","판매자로 등록되었습니다.");
		}else if(str.equals("seller error interior dupl")) {
			model.addAttribute("sellerResultMsg","ERROR : 인테리어 업체로 등록된 사업자번호입니다.");
		}else if(str.equals("seller dupl")) {
			model.addAttribute("sellerResultMsg","ERROR : 이미 판매자로 등록된 사업자번호입니다.");
		}	
		return "my/mypagecompanysignup";
	}
	
	@RequestMapping("my/interiormain")
	public String interiormain(HttpServletRequest request,Model model) {
		System.out.println("interiormain()");
		return "my/interiormain";
	}		
	@RequestMapping("my/interiorinfoedit")
	public String interiorinfoedit(HttpServletRequest request,Model model) {
		System.out.println("interiorinfoedit()");
		return "my/interiorinfoedit";
	}
	@RequestMapping("my/inteprofile")
	public String updateinteprofile(HttpServletRequest request,Model model) {
		System.out.println("updateinteprofile()");
		model.addAttribute("request",request);
		vservice =new MyProfileUpdateService(sqlSession,session);
		vservice.execute(model);
		return "my/interiorinfoedit";
	}
	@RequestMapping(method=RequestMethod.POST,value="my/intemodify")
	public String intemodify(HttpServletRequest request,Model model) {
		System.out.println("intemodify()");
		model.addAttribute("request",request);
		vservice =new MyModifyService(sqlSession,session);
		vservice.execute(model);
		return "my/interiorinfoedit";
	}
	
	@RequestMapping("my/interiorpasswordedit")
	public String interiorpasswordedit(HttpServletRequest request,Model model) {
		System.out.println("interiorpasswordedit()");
		model.addAttribute("request",request);
		sservice=new MyPasswordService(sqlSession,session);
		String str=sservice.execute(model);
		if(str.equals("not login")) {
			model.addAttribute("msg","로그인정보가 없습니다. 로그인해주세요");
			return "my/loginform";
		}else {		
			return "my/interiorpasswordedit";
		}
	}
	@RequestMapping(method=RequestMethod.POST,value="my/intepassedit")
	public String intepassedit(HttpServletRequest request,Model model) {
		System.out.println("intepassedit()");
		model.addAttribute("request",request);
		sservice =new MyPasswordEditService(sqlSession);
		String str=sservice.execute(model);
		if(str.equals("password reset success")) {
			session.invalidate();
			model.addAttribute("msg","비밀번호가 변경되었습니다. 다시 로그인해주세요");
			return "my/loginform";
		}else {
			model.addAttribute("msg","비밀번호 변경 오류");
			return "my/interiorpasswordedit";
		}		
	}	
	
	@RequestMapping("my/sellermain")
	public String sellermain(HttpServletRequest request,Model model) {
		System.out.println("sellermain()");
		return "my/sellermain";
	}		
	@RequestMapping("my/sellerinfoedit")
	public String sellerinfoedit(HttpServletRequest request,Model model) {
		System.out.println("sellerinfoedit()");
		return "my/sellerinfoedit";
	}
	@RequestMapping("my/sellerprofile")
	public String updatesellerprofile(HttpServletRequest request,Model model) {
		System.out.println("updatesellerprofile()");
		model.addAttribute("request",request);
		vservice =new MyProfileUpdateService(sqlSession,session);
		vservice.execute(model);
		return "my/sellerinfoedit";
	}
	@RequestMapping(method=RequestMethod.POST,value="my/sellermodify")
	public String sellermodify(HttpServletRequest request,Model model) {
		System.out.println("sellermodify()");
		model.addAttribute("request",request);
		vservice =new MyModifyService(sqlSession,session);
		vservice.execute(model);
		return "my/sellerinfoedit";
	}
	@RequestMapping("my/sellerpasswordedit")
	public String sellerpasswordedit(HttpServletRequest request,Model model) {
		System.out.println("sellerpasswordedit()");
		model.addAttribute("request",request);
		sservice=new MyPasswordService(sqlSession,session);
		String str=sservice.execute(model);
		if(str.equals("not login")) {
			model.addAttribute("msg","로그인정보가 없습니다. 로그인해주세요");
			return "my/loginform";
		}else {		
			return "my/sellerpasswordedit";
		}
	}
	@RequestMapping(method=RequestMethod.POST,value="my/sellerpassedit")
	public String sellerpassedit(HttpServletRequest request,Model model) {
		System.out.println("sellerpassedit()");
		model.addAttribute("request",request);
		sservice =new MyPasswordEditService(sqlSession);
		String str=sservice.execute(model);
		if(str.equals("password reset success")) {
			session.invalidate();
			model.addAttribute("msg","비밀번호가 변경되었습니다. 다시 로그인해주세요");
			return "my/loginform";
		}else {
			model.addAttribute("msg","비밀번호 변경 오류");
			return "my/sellerpasswordedit";	
		}
	}
			
	@RequestMapping("my/admin_memberlist")
	public String memberlist(HttpServletRequest request,Model model) {
		System.out.println("admin_memberlist()");
		model.addAttribute("request",request);
		vservice=new MemberListService(sqlSession);
		vservice.execute(model);
		return "my/admin_memberlist";
	}
	
	@RequestMapping("my/admin_demandwithdrawal")
	public String admin_demandwithdrawal(HttpServletRequest request,Model model) {
		System.out.println("admin_demandwithdrawal()");
		model.addAttribute("request",request);
		vservice=new DemandWithdrawalMemberService(sqlSession);
		vservice.execute(model);
		return "my/admin_demandwithdrawal";
	}
	
	@RequestMapping("my/allowCheckWithdrawal")
	public String allowCheckWithdrawal(HttpServletRequest request,Model model) {
		System.out.println("allowCheckWithdrawal()");
		model.addAttribute("request",request);
		vservice = new AllowCheckWithdrawalService(sqlSession);
		vservice.execute(model);		
		return "redirect:admin_demandwithdrawal";
	}
	
}
