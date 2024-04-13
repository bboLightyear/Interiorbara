package com.tech.ibara.my.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.my.dao.MyDao;
import com.tech.ibara.my.dto.MyNonMemberDto;


public class NonmemberEstimateSearchService implements SService {
	private SqlSession sqlSession;
	public NonmemberEstimateSearchService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	@Override
	public String execute(Model model) {
		System.out.println("NonmemberEstimateSearchService()");
		Map<String, Object> map = model.asMap();
		HttpServletRequest request= (HttpServletRequest) map.get("request");
//		String estino=request.getParameter("estino");
		String email=request.getParameter("email");
		MyDao mdao=sqlSession.getMapper(MyDao.class);
		int count=mdao.countCheckNonmember(email);
		System.out.println(email+"번 휴대폰번호의 비회원은 "+count+"명");
		MyNonMemberDto ndto=mdao.getNonmember(email);
		if(count==0) {//폰번호로 일치하는 데이터가 없는경우
			return "emailNull";
		}else {//phone번호가 일치하는 데이터가 있음 -> MyNonMemberDto 형식으로 비회원 정보 담고 견적번호로 견적정보 불러와서 모델에 담아서 뷰단에 뿌려주기
			model.addAttribute("ndto",ndto);
		}
		return "";
	}

}
