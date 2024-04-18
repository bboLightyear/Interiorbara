package com.tech.ibara.biz.service.home;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.tech.ibara.biz.dao.BizIDao;
import com.tech.ibara.biz.dto.BizCasesImgDto;
import com.tech.ibara.biz.dto.BizHomeDto;
import com.tech.ibara.biz.dto.BizRvDto;
import com.tech.ibara.biz.service.BizServiceInter;
import com.tech.ibara.biz.vo.BizSearchVO;
import com.tech.ibara.my.dto.MyMemberInfoDto;

@Service
public class BizRvListUnderStarCntAscService implements BizServiceInter {

	private SqlSession sqlSession;
	private HttpSession session;
	
	public BizRvListUnderStarCntAscService(SqlSession sqlSession, HttpSession session) {
		// TODO Auto-generated constructor stub
		this.sqlSession=sqlSession;
		this.session=session;
	}

	@Override
	public void execute(Model model) {
		
		System.out.println("service BizRvListUnderStarCntService>>>");
		
		Map<String, Object> map=model.asMap();
		
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		BizSearchVO searchVO=(BizSearchVO) map.get("searchVO");
		
		BizIDao dao=sqlSession.getMapper(BizIDao.class);
		
		
		String inteno=request.getParameter("inteno");
		model.addAttribute("inteno", inteno);
		System.out.println("inteno:"+inteno);
		
		MyMemberInfoDto mdto= (MyMemberInfoDto) session.getAttribute("loginUserDto");
		
		if(mdto==null) {
			model.addAttribute("isBmarked",false);			
		}else {
			int imemno=mdto.getMemno();
			String memno = Integer.toString(imemno);
			model.addAttribute("memno", memno);
			
//				접속한 회원의 해당업체 북마크 여부를 확인
				Integer bizHomeCheckBmarkedCnt=0;
				bizHomeCheckBmarkedCnt=dao.bizHomeCheckBmarkedCnt(memno, inteno);
				if(bizHomeCheckBmarkedCnt==0) {
					model.addAttribute("isBmarked",false);
				}else {
					model.addAttribute("isBmarked",true);
				}
			
//				북마크 누른 홈 목록을 확인		
				ArrayList<Integer> getBmarkedHomesByUser=dao.getBmarkedHomesByUser(memno);
				model.addAttribute("getBmarkedHomesByUser", getBmarkedHomesByUser);
		}
		
		
		
//		상단의 업체정보에 들어갈 내용(업체명, 대표사진, 업체주소, 전문시공영역, 공지내용, 업체정보넘버)을 불러오는 함수
		BizHomeDto bizHome = dao.bizHome(inteno);
		model.addAttribute("bizHome", bizHome);


		
//		해당업체 시공리뷰 개수를 세는 함수
		Integer bizHomeRvCnt=dao.bizHomeRvCnt(inteno);
		model.addAttribute("bizHomeRvCnt", bizHomeRvCnt);
		
//		해당업체 시공리뷰 별점의 평균을 세는 함수
		
		float bizHomeRvPointAvg=0.0f;
		
		if(bizHomeRvCnt!=0) {
			bizHomeRvPointAvg=dao.bizHomeRvPointAvg(inteno);			
		}
		
		model.addAttribute("bizHomeRvPointAvg", bizHomeRvPointAvg);

		
//		시공사례 개수를 세는 함수
		Integer bizHomeCasesCnt=dao.bizHomeCasesCnt(inteno);
		model.addAttribute("bizHomeCasesCnt", bizHomeCasesCnt);
		
		
//		시공사례 사진을 게시물별로 1개씩(총 3개 필요) 불러오는 함수
//		rownum 1, 2, 3을 가져온다.
//		이미지 테이블에서 파일 이름 가져오기
//		3개니 어레이리스트에 담는다.	
		ArrayList<BizCasesImgDto> bizHomeCasesImgList=null;
		if(bizHomeCasesCnt!=0) {			
			bizHomeCasesImgList = dao.bizHomeCasesImgList(inteno);
		}
		model.addAttribute("bizHomeCasesImgList", bizHomeCasesImgList);	
		
//		시공리뷰 개수를 세는 함수 //위에 만듦
//		시공리뷰 사진을 게시물별로 1개씩(총 3개 필요), 내용을 몇 줄 불러오는 함수
//		rownum 1, 2, 3을 가져온다.
//		리뷰 테이블에서 내용, 이미지 테이블에서 파일 이름 가져오기
//		3개니 어레이리스트에 담는다.	
		ArrayList<BizRvDto> bizHomeRvImgList =null;
		if(bizHomeRvCnt!=0) {
			bizHomeRvImgList = dao.bizHomeRvImgList(inteno);
		}
		model.addAttribute("bizHomeRvImgList", bizHomeRvImgList);	
		
		
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
			total=dao.selectRvTotalCount1(searchKeyword, inteno);
		}else if (br_content.equals("") && br_writer.equals("br_writer")) { //작성자 닉네임만 검색
			total=dao.selectRvTotalCount2(searchKeyword, inteno);
		}else if (br_content.equals("br_content") && br_writer.equals("br_writer")) { //둘 다 검색
			total=dao.selectRvTotalCount3(searchKeyword, inteno);
//			System.out.println("total>>>>>"+total);
		}else if (br_content.equals("") && br_writer.equals("")) { //아무것도 체크 안 함
			total=dao.selectRvTotalCount4(searchKeyword, inteno);
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
			bizRvList = dao.bizRvListStarCntAsc(rowStart,rowEnd,searchKeyword,"1", inteno);
//			model.addAttribute("bizRvList",dao.bizRvList(rowStart,rowEnd,searchKeyword,"1"));
		}else if (br_content.equals("") && br_writer.equals("br_writer")) { //작성자 닉네임만 검색
			bizRvList = dao.bizRvListStarCntAsc(rowStart,rowEnd,searchKeyword,"2", inteno);
//			model.addAttribute("bizRvList",dao.bizRvList(rowStart,rowEnd,searchKeyword,"2"));
		}else if (br_content.equals("br_content") && br_writer.equals("br_writer")) { //둘 다 검색
			bizRvList = dao.bizRvListStarCntAsc(rowStart,rowEnd,searchKeyword,"3", inteno);
//			model.addAttribute("bizRvList",dao.bizRvList(rowStart,rowEnd,searchKeyword,"3"));
		}else if (br_content.equals("") && br_writer.equals("")) { //아무것도 체크 안 함
			bizRvList = dao.bizRvListStarCntAsc(rowStart,rowEnd,searchKeyword,"4", inteno);
//			model.addAttribute("bizRvList",dao.bizRvList(rowStart,rowEnd,searchKeyword,"4"));
		}	
				
		
		System.out.println(bizRvList);
		model.addAttribute("bizRvList", bizRvList);
		model.addAttribute("totRowcnt", total);
		model.addAttribute("searchVO", searchVO);
		
		
		ArrayList<BizRvDto> joinList=dao.getRvImgJoinStarCntAsc(inteno);
		
//		for (BizRvDto BizRvDto : joinList) {
//			System.out.println(BizRvDto.getBr_no()+" : "+BizRvDto.getBizRvImgDto().getBrimg_cgn());
//		}
	
		model.addAttribute("joinList", joinList);
		
		
		
		
	}

}