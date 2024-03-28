package com.tech.ibara.biz.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.tech.ibara.biz.dao.BizIDao;
import com.tech.ibara.biz.dto.BizMgzDto;
import com.tech.ibara.biz.vo.BizSearchVO;

@Service
public class BizMgzListService implements BizServiceInter {

	private SqlSession sqlSession;

	public BizMgzListService(SqlSession sqlSession) {
		// TODO Auto-generated constructor stub
		this.sqlSession=sqlSession;
	}

	@Override
	public void execute(Model model) {
		
		System.out.println("service BizMgzListService>>>");
		
		Map<String, Object> map=model.asMap();
		
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		BizSearchVO searchVO=(BizSearchVO) map.get("searchVO");
		BizIDao dao=sqlSession.getMapper(BizIDao.class);
		
		String bm_title="";
		String bm_content="";
		
		String[] brdtitle=request.getParameterValues("searchType");
		System.out.println("brdtitle : "+brdtitle);
		
		//체크박스 체크 안 했을 때 null값 오류 방지
		if (brdtitle!=null) {
			for (String str : brdtitle) {
				System.out.println(str);
			}
		}

		if (brdtitle!=null) {
			//위 변수의 체크상태 저장
			for (String var : brdtitle) {
				if (var.equals("bm_title")) {
					bm_title="bm_title";
					model.addAttribute("bm_title","true");
				}else if (var.equals("bm_content")) {
					bm_content="bm_content";
					model.addAttribute("bm_content","true");
				}
			}
		}
		
		//검색 결과 유지
		String bt=request.getParameter("bm_title");
		String bc=request.getParameter("bm_content");
		if (bt!=null) {
			if (bt.equals("bm_title")) {
				bm_title=bt;
				model.addAttribute("bm_title","true");
			}
		}
		if (bc!=null) {
			if (bc.equals("bm_content")) {
				bm_content=bc;
				model.addAttribute("bm_content","true");
			}
		}
		
		
		
		//sk값 가져오기
		String searchKeyword=request.getParameter("sk");
		if (searchKeyword==null) {
			searchKeyword="";
		}
		model.addAttribute("resk", searchKeyword);
		System.out.println("skkkk: "+searchKeyword);		
		
//		<paging---->
		String strPage=request.getParameter("page");
		
		//검색어 아무것도 입력 안해줬을 때의 null처리
		if(strPage==null)
			strPage="1";
		
		int page=Integer.parseInt(strPage);
		searchVO.setPage(page);

		
		int total=0;
		if (bm_title.equals("bm_title") && bm_content.equals("")) { //제목만 검색
			total=dao.selectBoardTotalCount1(searchKeyword);
		}else if (bm_title.equals("") && bm_content.equals("bm_content")) { //내용만 검색
			total=dao.selectBoardTotalCount2(searchKeyword);
		}else if (bm_title.equals("bm_title") && bm_content.equals("bm_content")) { //둘 다 검색
			total=dao.selectBoardTotalCount3(searchKeyword);
		}else if (bm_title.equals("") && bm_content.equals("")) { //아무것도 체크 안 함
			total=dao.selectBoardTotalCount4(searchKeyword);
		}
		
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
		
		ArrayList<BizMgzDto> bizMgzList = null;
		
		if (bm_title.equals("bm_title") && bm_content.equals("")) { //제목만 검색
			bizMgzList = dao.bizMgzList(rowStart,rowEnd,searchKeyword,"1");
//			model.addAttribute("bizMgzList",dao.bizMgzList(rowStart,rowEnd,searchKeyword,"1"));
		}else if (bm_title.equals("") && bm_content.equals("bm_content")) { //내용만 검색
			bizMgzList = dao.bizMgzList(rowStart,rowEnd,searchKeyword,"2");
//			model.addAttribute("bizMgzList",dao.bizMgzList(rowStart,rowEnd,searchKeyword,"2"));
		}else if (bm_title.equals("bm_title") && bm_content.equals("bm_content")) { //둘 다 검색
			bizMgzList = dao.bizMgzList(rowStart,rowEnd,searchKeyword,"3");
//			model.addAttribute("bizMgzList",dao.bizMgzList(rowStart,rowEnd,searchKeyword,"3"));
		}else if (bm_title.equals("") && bm_content.equals("")) { //아무것도 체크 안 함
			bizMgzList = dao.bizMgzList(rowStart,rowEnd,searchKeyword,"4");
//			model.addAttribute("bizMgzList",dao.bizMgzList(rowStart,rowEnd,searchKeyword,"4"));
		}	
				
		
		System.out.println(bizMgzList);
		model.addAttribute("bizMgzList", bizMgzList);
		model.addAttribute("totRowcnt", total);
		model.addAttribute("searchVO", searchVO);
		
	}

}