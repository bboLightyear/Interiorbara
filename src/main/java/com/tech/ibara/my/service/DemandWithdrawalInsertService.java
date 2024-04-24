package com.tech.ibara.my.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.my.dao.MyDao;
import com.tech.ibara.my.dto.MyMemberInfoDto;

public class DemandWithdrawalInsertService implements VService {	
	private SqlSession sqlSession;
	public DemandWithdrawalInsertService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	@Override
	public void execute(Model model) {
		System.out.println("DemandWithdrawalInsertService()");
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String memtype=request.getParameter("memtype");
		String memno=request.getParameter("memno");
		System.out.println("memno : "+memno);
		
		String reason=request.getParameter("withdrawalCheck");
		System.out.println("withdrawal reason : "+reason);
		MyDao mdao=sqlSession.getMapper(MyDao.class);
		int memnoDupl=mdao.memnoDuplCheck(memno);
		if(memno.equals("")) {
			model.addAttribute("msg","로그인해주세요");
		}else if(memtype.equals("ADMIN")) {
			model.addAttribute("msg","관리자는 탈퇴할수 없습니다.");
		}else {
			if(memnoDupl==0) {
				mdao.insertMyWithdrawal(memno,reason);
				model.addAttribute("msg","탈퇴신청이 완료되었습니다.");
			} else {
				model.addAttribute("msg","이미 탈퇴신청을 하셨습니다.");
			}
		}	 
	}
}
