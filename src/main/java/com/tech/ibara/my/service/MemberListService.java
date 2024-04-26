package com.tech.ibara.my.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.my.dao.MyDao;
import com.tech.ibara.my.dto.MyMemberInfoDto;

public class MemberListService implements VService{
	private SqlSession sqlSession;
	public MemberListService (SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	@Override
	public void execute(Model model) {
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		String searchKeyword=request.getParameter("sk");
		if(searchKeyword==null) {
			searchKeyword="";
		}
		model.addAttribute("resk",searchKeyword);
		int total=0;
		String mlSel=request.getParameter("searchType");
		model.addAttribute("mlSel",mlSel);
		MyDao mdao=sqlSession.getMapper(MyDao.class);
		if(mlSel==null) {
			mlSel="";
		}
		if(mlSel.equals("num")) {
			total=mdao.countMemberList("1",searchKeyword);
			model.addAttribute("mlist",mdao.getMemberInfoList("1",searchKeyword));
		}else if(mlSel.equals("nn")) {
			total=mdao.countMemberList("2",searchKeyword);
			model.addAttribute("mlist",mdao.getMemberInfoList("2",searchKeyword));
		}else if(mlSel.equals("mt")) {
			total=mdao.countMemberList("3",searchKeyword);
			model.addAttribute("mlist",mdao.getMemberInfoList("3",searchKeyword));
		}else if(mlSel.equals("")) {
			total=mdao.countMemberList("4",searchKeyword);
			model.addAttribute("mlist",mdao.getMemberInfoList("4",searchKeyword));
		}
		model.addAttribute("total",total);

	}
}
