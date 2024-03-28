package com.tech.ibara.biz.service.review;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.tech.ibara.biz.dao.BizIDao;
import com.tech.ibara.biz.dto.BizRvDto;
import com.tech.ibara.biz.dto.BizRvImgDto;
import com.tech.ibara.biz.service.BizServiceInter;

@Service
public class BizRvContentViewService implements BizServiceInter {

	private SqlSession sqlSession;
	
	public BizRvContentViewService(SqlSession sqlSession) {
		// TODO Auto-generated constructor stub
		this.sqlSession=sqlSession;
	}

	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub
		
		System.out.println("service BizRvContentViewService>>>");
		
		Map<String, Object> map=model.asMap();
		
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		BizIDao dao=sqlSession.getMapper(BizIDao.class);
		
		String br_no=request.getParameter("br_no");
		 //세션에서 접속한 유저 넘버 가져오기
		String user_idno=request.getParameter("user_idno");
		
		System.out.println(br_no);
		System.out.println(user_idno);
		
//		dao.bizRvUpHit(br_no);
		
		BizRvDto dto=dao.bizRvContentView(br_no);
		model.addAttribute("bizRvContentView",dto);
		
		
		// 접속유저 기준 해당 리뷰에 좋아요를 찍었는지 안 찍었는지 확인		
		int total=0;		
//		그냥 내일 resultmap으로 한번에 담아버리자. 아 빡쳐...
		
		total=dao.bizRvLikeCnt(br_no, user_idno);
		String heartIs="";
		if(total!=0) {
			heartIs="heart.png";
		}else {
			heartIs="heartempty.png";
		}
		System.out.println("total : "+total);
		model.addAttribute("bizRvLikeCnt", total);
		model.addAttribute("heartIs", heartIs);
		model.addAttribute("user_idno", user_idno);
		
//		이미지 테이블에서 파일 이름 가져오기
//		그림이 여러 개 있을 수 있으니 어레이리스트에 담는다.
		ArrayList<BizRvImgDto> imglist=dao.selectBizRvImg(br_no);
		model.addAttribute("imglist", imglist);	
		
	}

}
