package com.tech.ibara.biz.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.tech.ibara.biz.dao.BizIDao;
import com.tech.ibara.biz.dto.BizMgzDto;
import com.tech.ibara.biz.dto.BizMgzImgDto;

@Service
public class BizMgzContentViewService implements BizServiceInter {

	private SqlSession sqlSession;
	
	public BizMgzContentViewService(SqlSession sqlSession) {
		// TODO Auto-generated constructor stub
		this.sqlSession=sqlSession;
	}

	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub
		
		System.out.println("service BizMgzContentViewService>>>");
		
		Map<String, Object> map=model.asMap();
		
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		BizIDao dao=sqlSession.getMapper(BizIDao.class);
		
		String bm_no=request.getParameter("bm_no");
		System.out.println(bm_no);
		
		dao.bizMgzUpHit(bm_no);
		
		BizMgzDto dto=dao.bizMgzContentView(bm_no);
		
		model.addAttribute("bizMgzContentView",dto);
		
//		이미지 테이블에서 파일 이름 가져오기
//		그림이 여러 개 있을 수 있으니 어레이리스트에 담는다.
		ArrayList<BizMgzImgDto> imglist=dao.selectBizMgzImg(bm_no);
		model.addAttribute("imglist", imglist);	
		
	}

}
