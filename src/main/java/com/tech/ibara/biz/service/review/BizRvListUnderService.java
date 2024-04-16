package com.tech.ibara.biz.service.review;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.tech.ibara.biz.dao.BizIDao;
import com.tech.ibara.biz.dto.BizRvDto;
import com.tech.ibara.biz.service.BizServiceInter;
import com.tech.ibara.biz.vo.BizSearchVO;

@Service
public class BizRvListUnderService implements BizServiceInter {

	private SqlSession sqlSession;

	public BizRvListUnderService(SqlSession sqlSession) {
		// TODO Auto-generated constructor stub
		this.sqlSession=sqlSession;
	}

	@Override
	public void execute(Model model) {

		System.out.println("service BizRvListUnderService>>>");
		
		Map<String, Object> map=model.asMap();
		
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		BizSearchVO searchVO=(BizSearchVO) map.get("searchVO");
		
		BizIDao dao=sqlSession.getMapper(BizIDao.class);
		
//		업체넘버(inteno)와 접속한 회원넘버(memno)를 앞 창에서 불러와야 하나,
//		거리순 둘러보기 창을 만들기 전이라 우선 1과 1000으로 각각 설정
//		홈 수정 후 돌아갈 때 mft리퀘스트 관련 오류가 날 수도 있을 것 같다... 체크필요함;
//		String inteno=request.getParameter("inteno");
		String inteno=map.get("inteno").toString();
		String memno=map.get("memno").toString();
		System.out.println("업체넘버: "+inteno);
		System.out.println("유저넘버: "+memno);
		
		model.addAttribute("inteno", inteno);
		model.addAttribute("memno", memno);
		
//		<paging---->
		String strPage=null;
		
		//검색어 아무것도 입력 안해줬을 때의 null처리
		if(strPage==null) {
			strPage="1";}
		
		int page=Integer.parseInt(strPage);
		searchVO.setPage(page);

		
		int total=0;
			total=dao.selectRvTotalCount4("", inteno);
		
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
		
		ArrayList<BizRvDto> bizRvList = dao.bizRvList(rowStart,rowEnd,"","4", inteno);
//			model.addAttribute("bizRvList",dao.bizRvList(rowStart,rowEnd,searchKeyword,"4"));
			
				
		
		System.out.println(bizRvList);
		model.addAttribute("bizRvList", bizRvList);
		model.addAttribute("totRowcnt", total);
		model.addAttribute("searchVO", searchVO);
		
		
		ArrayList<BizRvDto> joinList=dao.getRvImgJoin(inteno);
		
//		for (BizRvDto BizRvDto : joinList) {
//			System.out.println(BizRvDto.getBr_no()+" : "+BizRvDto.getBizRvImgDto().getBrimg_cgn());
//		}
	
		model.addAttribute("joinList", joinList);
		
		
		
		
	}

}