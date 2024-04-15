package com.tech.ibara.biz.service.home;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.tech.ibara.biz.dao.BizIDao;
import com.tech.ibara.biz.dto.BizHomeDto;
import com.tech.ibara.biz.service.BizServiceInter;

@Service
public class BizHomeBmarkService implements BizServiceInter {

	private SqlSession sqlSession;

	public BizHomeBmarkService(SqlSession sqlSession) {
		// TODO Auto-generated constructor stub
		this.sqlSession=sqlSession;
	}

	@Override
	public void execute(Model model) {
		
		System.out.println("service BizHomeBmarkService>>>");
		
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		HttpServletResponse response=(HttpServletResponse) map.get("response");
		
		String inteno=request.getParameter("inteno");
		String memno = request.getParameter("memno");
		String bh_no=request.getParameter("bh_no");
		
		BizIDao dao=sqlSession.getMapper(BizIDao.class);
		
		BizHomeDto bizHome = dao.bizHome(inteno);
		model.addAttribute("bizHome", bizHome);
		model.addAttribute("inteno", inteno);
		model.addAttribute("bh_no", bh_no);
		
		if(memno!="") {
	//			접속한 회원의 해당업체 북마크 여부를 확인
				Integer bizHomeCheckBmarkedCnt=0;
				boolean bizHomeCheckBmarked=false;
				bizHomeCheckBmarkedCnt=dao.bizHomeCheckBmarkedCnt(memno, inteno);
				if(bizHomeCheckBmarkedCnt!=0) {
					bizHomeCheckBmarked=true;
				}else {
					bizHomeCheckBmarked=false;
				}
				
				System.out.println("접속한 회원의 해당업체 북마크 여부: "+bizHomeCheckBmarked);
				
				
	//			ArrayList<Integer> getBmarkedHomesByUser=dao.getBmarkedHomesByUser(memno);
	//			model.addAttribute("bmarkedHomeIds", getBmarkedHomesByUser);
				
			    //좋아요 눌렀을때의 동작
			    try {
			    	//좋아요 눌렀는지 유무 확인하고
			    	//눌렀으면 좋아요 취소
			    	if (bizHomeCheckBmarked==true) {
			    		dao.bizHomeBmarkDel(memno, inteno);
						dao.bizHomeBmarkSubt(bh_no);
			    		System.out.println("좋아요 취소됨");
			    		model.addAttribute("isBmarked",false);
			    	} else {
			    		//좋아요 추가
			    		dao.bizHomeBmarkAdd(memno, inteno);
						dao.bizHomeBmarkPlus(bh_no);
			    		System.out.println("좋아요됨");
			    		model.addAttribute("isBmarked",true);
			    	}
			    } catch (Exception e) {
			    	System.out.println("에러");
			    	e.printStackTrace();
		    }	
		}else{
			System.out.println("비회원입니다. 로그인 화면으로 이동합니다.");
		}
		

	}
}
