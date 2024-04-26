package com.tech.ibara.my.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.my.dao.MyDao;

public class AllowCheckWithdrawalService implements VService{
	private SqlSession sqlSession;
	public AllowCheckWithdrawalService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
				
	@Override
	public void execute(Model model) {
		System.out.println("AllowCheckWithdrawalService()");
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		String memno=request.getParameter("memno");
		MyDao mdao=sqlSession.getMapper(MyDao.class);
		String yesno=mdao.yesnoCheck_Withdrawal(memno);
		String memtype=mdao.getMemtype(memno);
		System.out.println(memno+"번 회원의 현재 멤버타입 은 "+memtype);
		if(yesno.equals("N")) {
//			if(memtype.equals("INTERIOR")) {
//				mdao.deleteInterior(memno);				
//			}else if(memtype.equals("SELLER")) {
//				mdao.deleteSeller(memno);
//			}			
			mdao.allowWithdrawal("Y",memno);
			mdao.completedWithdrawal(memno);
		}else {
			mdao.allowWithdrawal("N", memno);
			mdao.cancelWithdrawal(memno);
		}
	}
}
