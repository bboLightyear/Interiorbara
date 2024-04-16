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
import com.tech.ibara.biz.dto.BizRvImgDto;
import com.tech.ibara.biz.service.BizServiceInter;
import com.tech.ibara.my.dto.MyMemberInfoDto;

@Service
public class BizHomeService implements BizServiceInter {

	private SqlSession sqlSession;
	private HttpSession session;
	
	public BizHomeService(SqlSession sqlSession, HttpSession session) {
		// TODO Auto-generated constructor stub
		this.sqlSession=sqlSession;
		this.session=session;
	}

	@Override
	public void execute(Model model) {

		System.out.println("service BizHomeService>>>");
		
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		BizIDao dao=sqlSession.getMapper(BizIDao.class);
		
//		홈 수정 후 돌아갈 때 mft리퀘스트 관련 오류가 날 수도 있을 것 같다... 체크필요함;
		String inteno=request.getParameter("inteno");
		model.addAttribute("inteno", inteno);

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
		
		
	}

}