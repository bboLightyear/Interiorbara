package com.tech.ibara.biz.service.cases;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.tech.ibara.biz.dao.BizIDao;
import com.tech.ibara.biz.dto.BizCasesDto;
import com.tech.ibara.biz.service.BizServiceInter;
import com.tech.ibara.biz.vo.BizSearchVO;

@Service
public class BizCasesListUnderService implements BizServiceInter {

	private SqlSession sqlSession;

	public BizCasesListUnderService(SqlSession sqlSession) {
		// TODO Auto-generated constructor stub
		this.sqlSession=sqlSession;
	}

	@Override
	public void execute(Model model) {
		
		System.out.println("service BizCasesListUnderService>>>");
		
		Map<String, Object> map=model.asMap();
		BizSearchVO searchVO=(BizSearchVO) map.get("searchVO");
		BizIDao dao=sqlSession.getMapper(BizIDao.class);
		
//		홈 수정 후 돌아갈 때 mft리퀘스트 관련 오류가 날 수도 있을 것 같다... 체크필요함;
		String inteno=map.get("inteno").toString();
		System.out.println("업체넘버: "+inteno);
		model.addAttribute("inteno", inteno);
		
//		<paging---->
		String strPage=null;
		
		//검색어 아무것도 입력 안해줬을 때의 null처리
		if(strPage==null) {
			strPage="1";}
		
		int page=Integer.parseInt(strPage);
		searchVO.setPage(page);
		
		int total=0;
		
			total=dao.selectCasesTotalCount5(inteno);
		
		System.out.println("total : "+total);
		
		
		searchVO.pageCalculate(total);
		
		//계산된 값
		System.out.println("totRow : "+total);
		System.out.println("clickpage : "+strPage);
		System.out.println("pageStart : "+searchVO.getPageStart());
		System.out.println("pageEnd : "+searchVO.getPageEnd());
		System.out.println("rowStart : "+searchVO.getRowStart());
		System.out.println("rowEnd : "+searchVO.getRowEnd());
		
		int rowStart=searchVO.getRowStart();
		int rowEnd=searchVO.getRowEnd();
		
		ArrayList<BizCasesDto> bizCasesList = dao.bizCasesList(rowStart,rowEnd,"","4", inteno);
			System.out.println("검색 없이 모든 게시글보기 수: "+bizCasesList.size());
	
				
		
		System.out.println(bizCasesList);
		model.addAttribute("bizCasesList", bizCasesList);
		model.addAttribute("totRowcnt", total);
		model.addAttribute("searchVO", searchVO);
		
	}

}