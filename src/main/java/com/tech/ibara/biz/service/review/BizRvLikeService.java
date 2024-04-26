package com.tech.ibara.biz.service.review;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.tech.ibara.biz.dao.BizIDao;
import com.tech.ibara.biz.dto.BizHomeDto;
import com.tech.ibara.biz.dto.BizRvDto;
import com.tech.ibara.biz.service.BizServiceInter;

@Service
public class BizRvLikeService implements BizServiceInter {

	private SqlSession sqlSession;

	public BizRvLikeService(SqlSession sqlSession) {
		// TODO Auto-generated constructor stub
		this.sqlSession=sqlSession;
	}

	@Override
	public void execute(Model model) {
		
		System.out.println("service BizRvLikeService>>>");
		
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		HttpServletResponse response=(HttpServletResponse) map.get("response");
		
		String memno = request.getParameter("memno");
		String br_no=request.getParameter("br_no");
		System.out.println("memno: "+memno);
		
		BizIDao dao=sqlSession.getMapper(BizIDao.class);
		
		BizRvDto dto=dao.bizRvContentView(br_no);
		model.addAttribute("bizRvContentView",dto);
		
		if(memno!="") {
//			접속한 회원의 해당리뷰 좋아요 여부를 확인
				int total=0;	
				boolean heartIs=false;
				total=dao.bizRvLikeCnt(br_no, memno);
				if(total!=0) {
					heartIs=true;
				}else {
					heartIs=false;
				}
				
				System.out.println("접속한 회원의 해당리뷰 좋아요 여부를 확인: "+heartIs);
				
				
//			ArrayList<Integer> getBmarkedHomesByUser=dao.getBmarkedHomesByUser(memno);
//			model.addAttribute("bmarkedHomeIds", getBmarkedHomesByUser);
				
				//좋아요 눌렀을때의 동작
				try {
					//좋아요 눌렀는지 유무 확인하고
					//눌렀으면 좋아요 취소
					if (heartIs==true) {
						dao.bizRvLikeDel(memno, br_no);
						dao.bizRvLikeSubt(br_no);
						System.out.println("좋아요 취소됨");
						model.addAttribute("heartIs",false);
					} else {
						//좋아요 추가
						dao.bizRvLikeAdd(memno, br_no);
						dao.bizRvLikePlus(br_no);
						System.out.println("좋아요됨");
						model.addAttribute("heartIs",true);
					}
				} catch (Exception e) {
					System.out.println("에러");
					e.printStackTrace();
				}	
		}else {
			System.out.println("비회원입니다. 로그인 화면으로 이동합니다.");
		}	
	}
}
