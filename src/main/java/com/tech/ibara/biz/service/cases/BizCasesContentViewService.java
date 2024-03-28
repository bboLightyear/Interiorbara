package com.tech.ibara.biz.service.cases;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.tech.ibara.biz.dao.BizIDao;
import com.tech.ibara.biz.dto.BizCasesDto;
import com.tech.ibara.biz.dto.BizCasesImgDto;
import com.tech.ibara.biz.service.BizServiceInter;

@Service
public class BizCasesContentViewService implements BizServiceInter {

	private SqlSession sqlSession;
	
	public BizCasesContentViewService(SqlSession sqlSession) {
		// TODO Auto-generated constructor stub
		this.sqlSession=sqlSession;
	}

	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub
		
		System.out.println("service BizCasesContentViewService>>>");
		
		Map<String, Object> map=model.asMap();
		
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		BizIDao dao=sqlSession.getMapper(BizIDao.class);
		
		String bc_no=request.getParameter("bc_no");
		System.out.println(bc_no);
		
		dao.bizCasesUpHit(bc_no);
		
		BizCasesDto dto=dao.bizCasesContentView(bc_no);
		
		model.addAttribute("bizCasesContentView",dto);
		
//		이미지 테이블에서 파일 이름 가져오기
//		그림이 여러 개 있을 수 있으니 어레이리스트에 담는다.
		ArrayList<BizCasesImgDto> imglist=dao.selectBizCasesImg(bc_no);
		model.addAttribute("imglist", imglist);	
		
	}

}
