package com.tech.ibara.my.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.my.dao.MyDao;
import com.tech.ibara.my.dto.MyMemberInfoDto;

public class MyPageService implements VService {
	private SqlSession sqlSession;
	public MyPageService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	@Override
	public void execute(Model model) {
		System.out.println("MyPageService");
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpSession session=request.getSession();
		String nickname=(String) session.getAttribute("sessionNickname");
		System.out.println("nickname : "+nickname);
		MyDao mdao=sqlSession.getMapper(MyDao.class);
		MyMemberInfoDto dto=mdao.getMemberFromNickname(nickname);
		model.addAttribute("dto",dto);
	}

}
