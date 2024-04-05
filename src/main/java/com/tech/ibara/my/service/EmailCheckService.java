package com.tech.ibara.my.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.my.dao.MyDao;
import com.tech.ibara.my.util.EmailSHA;

public class EmailCheckService implements SService {
	private SqlSession sqlSession;
	public EmailCheckService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
		
	@Override
	public String execute(Model model) {
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		String code=request.getParameter("code");
		String nickname=request.getParameter("nickname");
		MyDao mdao=sqlSession.getMapper(MyDao.class);
		String memberEmail=mdao.getMemberEmail(nickname);
		int mymemberemailcheck=mdao.getmailcheckNum(nickname);
		System.out.println("mymemberemailcheck : "+mymemberemailcheck);
		boolean isRight=(new EmailSHA().getSHA256(memberEmail).equals(code))?true:false;
		if(isRight==true){
			if(mymemberemailcheck==0) {
				mdao.setMemberEmailChecked(nickname);
				System.out.println("회원가입 메일인증성공");
				return "my/emailCheck";
			}else {
				System.out.println("비밀번호변경 메일 인증 성공");
				model.addAttribute("nickname",nickname);
				model.addAttribute("msg","비밀번호변경 메일 인증 성공");
				return "my/passwordReset";
			}
		}
		return "emailCheck error";
		
		
	}
}
