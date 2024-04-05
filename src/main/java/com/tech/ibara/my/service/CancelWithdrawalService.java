package com.tech.ibara.my.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.my.dao.MyDao;

public class CancelWithdrawalService implements VService{
	private SqlSession sqlSession;
	public CancelWithdrawalService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub
		System.out.println("CancelWithdrawalService()");
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String memno=request.getParameter("memno");
		MyDao mdao=sqlSession.getMapper(MyDao.class);
		int memnoDupl=mdao.memnoDuplCheck(memno);
		if(memnoDupl==1) {
			mdao.deleteDemandWithdrawal(memno);
			model.addAttribute("msg","탈퇴신청이 취소되었습니다.");
		}else {
			model.addAttribute("msg","탈퇴신청내역이 없습니다.");
		}		
	}
}
