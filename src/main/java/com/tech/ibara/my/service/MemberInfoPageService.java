package com.tech.ibara.my.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.my.dao.MyDao;
import com.tech.ibara.my.dto.MyMemberInfoDto;

public class MemberInfoPageService implements VService{
	private SqlSession sqlSession;
	public MemberInfoPageService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String memno =request.getParameter("memno");
		MyDao mdao=sqlSession.getMapper(MyDao.class);
		MyMemberInfoDto mdto=mdao.getMemberInfo("1",memno);
		model.addAttribute("mdto",mdto);		
	}

}
