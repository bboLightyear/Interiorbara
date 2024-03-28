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
public class BizRvModDelViewService implements BizServiceInter {

	private SqlSession sqlSession;
	
	public BizRvModDelViewService(SqlSession sqlSession) {
		// TODO Auto-generated constructor stub
		this.sqlSession=sqlSession;
	}

	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub
		
		System.out.println("service BizRvModDelViewService>>>");
		
		Map<String, Object> map=model.asMap();
		
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		BizIDao dao=sqlSession.getMapper(BizIDao.class);
		
		String br_no=request.getParameter("br_no");
		String br_point=request.getParameter("br_point");
		System.out.println(br_no);
		
		BizRvDto dto=dao.bizRvContentView(br_no);
		
		model.addAttribute("bizRvContentView",dto);
		
//		이미지 테이블에서 파일 이름 가져오기
//		그림이 여러 개 있을 수 있으니 어레이리스트에 담는다.
		ArrayList<BizRvImgDto> imglist=dao.selectBizRvImg(br_no);
		model.addAttribute("imglist", imglist);	
		
	}

}
