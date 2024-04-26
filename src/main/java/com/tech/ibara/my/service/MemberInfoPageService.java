package com.tech.ibara.my.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.my.dao.MyDao;
import com.tech.ibara.my.dto.MyMemberInfoDto;
import com.tech.ibara.my.dto.PhotoAttachDto;

public class MemberInfoPageService implements VService {
	private SqlSession sqlSession;

	public MemberInfoPageService(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String nickname = request.getParameter("nickname");
		String smemno = request.getParameter("memno");
		MyDao mdao = sqlSession.getMapper(MyDao.class);
		MyMemberInfoDto mdto;
		ArrayList<PhotoAttachDto> palist;
		if (smemno == null) {
			int countnickname=mdao.countCheck("2",nickname);
			if(countnickname==0) {
				model.addAttribute("msg","조회된 닉네임의 회원이 없습니다.");
			}else {
			mdto = mdao.getMemberInfo("2", nickname);
			model.addAttribute("mdto", mdto);
			int memno = mdao.getMemberMemno(nickname);
			palist = mdao.getMyPhoto(memno);
			model.addAttribute("palist", palist);
			}
		} else {
			int countmemno=mdao.countCheck("1", smemno);
			if(countmemno==0) {
				model.addAttribute("msg","조회된 멤버넘버의 회원이 없습니다.");				
			}else {
			mdto = mdao.getMemberInfo("1", smemno);
			model.addAttribute("mdto", mdto);
			int memno = Integer.parseInt(smemno);
			palist = mdao.getMyPhoto(memno);
			model.addAttribute("palist", palist);
			}
		}
	}
}
