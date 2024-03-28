package com.tech.ibara.my.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.my.dao.MyDao;
import com.tech.ibara.my.dto.MyMemberInfoDto;
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
		int mymemberemailcheck=mdao.emailCheck(memberEmail);
		boolean isRight=(new EmailSHA().getSHA256(memberEmail).equals(code))?true:false;
		if(isRight==true){
			mdao.setMemberEmailChecked(nickname);
			return "my/emailCheck";
		}else {
			return "emailCheck error";
		}
	}
}
