 package com.tech.ibara.biz.service.home;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.tech.ibara.biz.dao.BizIDao;
import com.tech.ibara.biz.dto.BizCasesImgDto;
import com.tech.ibara.biz.dto.BizHomeDto;
import com.tech.ibara.biz.dto.BizRvDto;
import com.tech.ibara.biz.dto.BizRvImgDto;
import com.tech.ibara.biz.service.BizServiceInter;

@Service
public class BizHomeUnderService implements BizServiceInter {

	private SqlSession sqlSession;

	public BizHomeUnderService(SqlSession sqlSession) {
		// TODO Auto-generated constructor stub
		this.sqlSession=sqlSession;
	}

	@Override
	public void execute(Model model) {

		System.out.println("service BizHomeUnderService>>>");
		
		Map<String, Object> map=model.asMap();
		
		BizIDao dao=sqlSession.getMapper(BizIDao.class);

//		홈 수정 후 돌아갈 때 mft리퀘스트 관련 오류가 날 수도 있을 것 같다... 체크필요함;
		String inteno=map.get("inteno").toString();
		System.out.println("업체넘버: "+inteno);
		
		model.addAttribute("inteno", inteno);
		
		
//		상단의 업체정보에 들어갈 내용(업체명, 대표사진, 업체주소, 전문시공영역, 공지내용, 업체정보넘버)을 불러오는 함수
		BizHomeDto bizHome = dao.bizHome(inteno);
		model.addAttribute("bizHome", bizHome);

//		해당업체 시공리뷰 별점의 평균을 세는 함수
		float bizHomeRvPointAvg=dao.bizHomeRvPointAvg(inteno);
		model.addAttribute("bizHomeRvPointAvg", bizHomeRvPointAvg);
		
//		해당업체 시공리뷰 개수를 세는 함수
		Integer bizHomeRvCnt=dao.bizHomeRvCnt(inteno);
		model.addAttribute("bizHomeRvCnt", bizHomeRvCnt);
		
//		시공사례 개수를 세는 함수
		Integer bizHomeCasesCnt=dao.bizHomeCasesCnt(inteno);
		model.addAttribute("bizHomeCasesCnt", bizHomeCasesCnt);
		
		
//		시공사례 사진을 게시물별로 1개씩(총 3개 필요) 불러오는 함수
//		rownum 1, 2, 3을 가져온다.
//		이미지 테이블에서 파일 이름 가져오기
//		3개니 어레이리스트에 담는다.	
		ArrayList<BizCasesImgDto> bizHomeCasesImgList = dao.bizHomeCasesImgList(inteno);
		model.addAttribute("bizHomeCasesImgList", bizHomeCasesImgList);	
		
//		시공사례 사진을 클릭하면 해당 사례 컨텐트뷰로 이동하는 링크
//		bc_no를 구해야한다. // 위 ArrayList bizHomeCasesImgList에 BC_NO도 담김
		
//		시공사례 더보기를 클릭하면 해당 업체의 시공사례 리스트로 리다이렉트해주는 링크
//		이건 그냥 리다이렉트 걸면 됨 	// 시공사례 리스트에서 inteno를 적용해 해당 업체 시공사례만 보이게 코딩해야 한다. OK
		
		
//		시공리뷰 개수를 세는 함수 //위에 만듦
//		시공리뷰 사진을 게시물별로 1개씩(총 3개 필요), 내용을 몇 줄 불러오는 함수
//		rownum 1, 2, 3을 가져온다.
//		리뷰 테이블에서 내용, 이미지 테이블에서 파일 이름 가져오기
//		3개니 어레이리스트에 담는다.	
		ArrayList<BizRvDto> bizHomeRvImgList = dao.bizHomeRvImgList(inteno);
		model.addAttribute("bizHomeRvImgList", bizHomeRvImgList);	
		
		
		
		
//		시공리뷰 게시물 클릭하면 해당 사례 컨텐트뷰로 이동하는 링크	//시간 되면 레스트 컨트롤러 사용해서 펼쳐지게 만들어볼까...? 3개 정도만?
//		br_no를 구해야한다. // 위 ArrayList bizHomeRvImgList에 br_no도 담김		
		
//		시공사례 더보기를 클릭하면 해당 업체의 시공사례 리스트로 리다이렉트해주는 링크
//		이건 그냥 리다이렉트 걸면 됨 	// 시공사례 리스트에서 inteno를 적용해 해당 업체 시공사례만 보이게 코딩해야 한다. OK
		
		
		
		
	}

}