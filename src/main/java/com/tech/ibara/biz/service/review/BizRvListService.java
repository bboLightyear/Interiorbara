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
public class BizRvListService implements BizServiceInter {

	private SqlSession sqlSession;

	public BizRvListService(SqlSession sqlSession) {
		// TODO Auto-generated constructor stub
		this.sqlSession=sqlSession;
	}

	@Override
	public void execute(Model model) {

		System.out.println("service BizRvListService>>>");
		
		Map<String, Object> map=model.asMap();
		
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		BizSearchVO searchVO=(BizSearchVO) map.get("searchVO");
		
		BizIDao dao=sqlSession.getMapper(BizIDao.class);
		
		String br_content="";
		String br_writer="";
		
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
				if (var.equals("br_content")) {
					br_content="br_content";
					model.addAttribute("br_content","true");
				}else if (var.equals("br_writer")) {
					br_writer="br_writer";
					model.addAttribute("br_writer","true");
				}
			}
		}
		
		//검색 결과 유지
		String bc=request.getParameter("br_content");
		String bw=request.getParameter("br_writer");
		if (bc!=null) {
			if (bc.equals("br_content")) {
				br_content=bc;
				model.addAttribute("br_content","true");
			}
		}
		if (bw!=null) {
			if (bw.equals("br_writer")) {
				br_writer=bw;
				model.addAttribute("br_writer","true");
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
		if(strPage==null) {
			strPage="1";}
		
		int page=Integer.parseInt(strPage);
		searchVO.setPage(page);

		
		int total=0;
		if (br_content.equals("br_content") && br_writer.equals("")) { //리뷰 내용만 검색
			total=dao.selectRvTotalCount1(searchKeyword);
		}else if (br_content.equals("") && br_writer.equals("br_writer")) { //작성자 닉네임만 검색
			total=dao.selectRvTotalCount2(searchKeyword);
		}else if (br_content.equals("br_content") && br_writer.equals("br_writer")) { //둘 다 검색
			total=dao.selectRvTotalCount3(searchKeyword);
//			System.out.println("total>>>>>"+total);
		}else if (br_content.equals("") && br_writer.equals("")) { //아무것도 체크 안 함
			total=dao.selectRvTotalCount4(searchKeyword);
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
		
		ArrayList<BizRvDto> bizRvList = null;
		
		if (br_content.equals("br_content") && br_writer.equals("")) { //리뷰내용만 검색
			bizRvList = dao.bizRvList(rowStart,rowEnd,searchKeyword,"1");
//			model.addAttribute("bizRvList",dao.bizRvList(rowStart,rowEnd,searchKeyword,"1"));
		}else if (br_content.equals("") && br_writer.equals("br_writer")) { //작성자 닉네임만 검색
			bizRvList = dao.bizRvList(rowStart,rowEnd,searchKeyword,"2");
//			model.addAttribute("bizRvList",dao.bizRvList(rowStart,rowEnd,searchKeyword,"2"));
		}else if (br_content.equals("br_content") && br_writer.equals("br_writer")) { //둘 다 검색
			bizRvList = dao.bizRvList(rowStart,rowEnd,searchKeyword,"3");
//			model.addAttribute("bizRvList",dao.bizRvList(rowStart,rowEnd,searchKeyword,"3"));
		}else if (br_content.equals("") && br_writer.equals("")) { //아무것도 체크 안 함
			bizRvList = dao.bizRvList(rowStart,rowEnd,searchKeyword,"4");
//			model.addAttribute("bizRvList",dao.bizRvList(rowStart,rowEnd,searchKeyword,"4"));
		}	
				
		
		System.out.println(bizRvList);
		model.addAttribute("bizRvList", bizRvList);
		model.addAttribute("totRowcnt", total);
		model.addAttribute("searchVO", searchVO);
		
		
		ArrayList<BizRvDto> joinList=dao.getRvImgJoin();
		
//		for (BizRvDto BizRvDto : joinList) {
//			System.out.println(BizRvDto.getBr_no()+" : "+BizRvDto.getBizRvImgDto().getBrimg_cgn());
//		}
	
		model.addAttribute("joinList", joinList);
		
		
		
		
	}

}