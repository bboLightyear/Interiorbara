package com.tech.ibara.oh.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.tech.ibara.my.dto.MyMemberInfoDto;
import com.tech.ibara.oh.dao.OHInterfaceDao;
import com.tech.ibara.oh.dto.OHPhotoAttach;
import com.tech.ibara.oh.dto.OHPhotoBoard;
import com.tech.ibara.oh.dto.OHPhotoLike;
import com.tech.ibara.oh.dto.OHPhotoScrap;
import com.tech.ibara.oh.vo.OHPageVO;

@Service
public class OHPhotoDetailViewService implements OHInterfaceService {

	private SqlSession sqlSession;
	
	public OHPhotoDetailViewService(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}	
	
	@Override
	public void execute(Model model) {
		System.out.println("OHPhotoDetailViewService");		
		System.out.println("------------------------------");
		
		// Return the current set of model attributes as a Map.
		Map<String, Object> map = model.asMap();
		
		// request
		HttpServletRequest request = (HttpServletRequest) map.get("request");		
	
		// ohPageVO
		OHPageVO ohPageVO = (OHPageVO) map.get("ohPageVO");
		
		// session
		HttpSession session = (HttpSession) map.get("session");		
		
		// OHInterfaceDao, SqlSession 연결
		OHInterfaceDao dao = sqlSession.getMapper(OHInterfaceDao.class);		
		
		// pb_no 변수 선언, 값 저장		
		String pb_no = request.getParameter("pb_no");
		// pb_no 변수, 값 출력
		System.out.println("pb_no: " + pb_no);
		System.out.println("------------------------------");

		// 게시글 조회수 증가, UpdatePb_hit() 함수 실행
		dao.updatePb_hit(pb_no);
		
		// getDtoOHPhotoBoard() 함수 실행
		OHPhotoBoard pb_dto = dao.getDtoOHPhotoBoard(pb_no);
		
		// model 값 전달
		model.addAttribute("pb_dto", pb_dto);
		
		// getDtoOHPhotoAttach() 함수 실행
		ArrayList<OHPhotoAttach> pa_dto = dao.getDtoOHPhotoAttach(pb_no);
		
		// model 값 전달
		model.addAttribute("pa_dto", pa_dto);

		// 로그인 사용자, 게시물 - 좋아요, 스크랩 표시
		// 변수 선언
		int memno = 0;
		// 로그인 정보, null Check
		if(session.getAttribute("loginUserDto") != null) {
			// 사용자 로그인 정보 출력
			MyMemberInfoDto loginUserDto = (MyMemberInfoDto) session.getAttribute("loginUserDto");
			memno = loginUserDto.getMemno();
			System.out.println("로그인 정보가 있습니다.");
			System.out.println("memno: " + memno);
			System.out.println("------------------------------");		
		} else {
			System.out.println("로그인 정보가 없습니다.");
			System.out.println("memno: " + memno);
			System.out.println("------------------------------");
		}					
		
		// OHPhotoLike 객체 담을 리스트 선언
		OHPhotoLike ohPhotoDetailLike = null;
		
		// OHPhotoScrap 객체 담을 리스트 선언
		OHPhotoScrap ohPhotoDetailScrap = null;		
		
		// 로그인 사용자 => True, 좋아요, 스크랩 표시
		if(session.getAttribute("loginUserDto") != null) {
			// ohPhotoLikeView() 함수 실행
			ohPhotoDetailLike = dao.ohPhotoDetailLikeView(memno, pb_no);
			System.out.println("ohPhotoDetailLikeView() 함수 실행완료");
			System.out.println("------------------------------");
			
			// model <- ohPhotoLike, 로그인 사용자, 게시물 - 좋아요 표시
			model.addAttribute("ohPhotoDetailLike", ohPhotoDetailLike);
			
			// ohPhotoScrapView() 함수 실행
			ohPhotoDetailScrap = dao.ohPhotoDetailScrapView(memno, pb_no);
			System.out.println("ohPhotoDetailScrapView() 함수 실행완료");
			System.out.println("------------------------------");
			
			// model <- ohPhotoScrap, 로그인 사용자, 게시물 - 스크랩 표시
			model.addAttribute("ohPhotoDetailScrap", ohPhotoDetailScrap);			
		} else {
			System.out.println("비회원 입니다.");
			System.out.println("ohPhotoLikeView() 함수 실행불가");
			System.out.println("ohPhotoScrapView() 함수 실행불가");
			System.out.println("------------------------------");
		}		
				
	}

}
