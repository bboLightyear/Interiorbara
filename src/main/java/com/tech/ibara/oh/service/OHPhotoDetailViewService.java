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
import com.tech.ibara.oh.dto.OHPhotoReply;
import com.tech.ibara.oh.dto.OHPhotoReplyLike;
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
		
		// --- sorting ---
		// --- sorting 변수 선언, 값 저장 ---
		String orderingBy = request.getParameter("orderingBy");
		String orderingMethod = request.getParameter("orderingMethod");
		// --- sorting 변수 값 출력 ---
		System.out.println("--- sorting 변수 값 출력 ---");
		System.out.println("orderingBy: " + orderingBy);
		System.out.println("orderingMethod: " + orderingMethod);
		System.out.println("------------------------------");		
		
		// 모델, orderingBy 저장
		model.addAttribute("orderingBy", orderingBy);
		// 모델, orderingMethod 저장
		model.addAttribute("orderingMethod", orderingMethod);
		
		// --- filtering ---
		// --- filtering 변수 선언, 값 저장 ---
		String pb_residence = request.getParameter("pb_residence");
		String pb_room = request.getParameter("pb_room");
		String pb_style = request.getParameter("pb_style");
		String pb_skill = request.getParameter("pb_skill");
		// --- filtering 변수 값 출력 ---
		System.out.println("--- filtering 변수 값 출력 ---");
		System.out.println("pb_residence: " + pb_residence);
		System.out.println("pb_room: " + pb_room);
		System.out.println("pb_style: " + pb_style);
		System.out.println("pb_skill: " + pb_skill);
		System.out.println("------------------------------");		
		
		// 모델, pb_residence 저장
		model.addAttribute("pb_residence", pb_residence);
		// 모델, pb_room 저장
		model.addAttribute("pb_room", pb_room);
		// 모델, pb_style 저장
		model.addAttribute("pb_style", pb_style);
		// 모델, pb_skill 저장
		model.addAttribute("pb_skill", pb_skill);		
		
		// --- searching ---
		// --- searching 변수 값 출력 ---
		String searchingType = request.getParameter("searchingType");
		String searchingWord = request.getParameter("searchingWord");
		// --- searching 변수 값 출력 ---
		System.out.println("--- searching 변수 값 출력 ---");
		System.out.println("searchingType: " + searchingType);
		System.out.println("searchingWord: " + searchingWord);
		System.out.println("------------------------------");		
		
		// 모델, searchingType 저장
		model.addAttribute("searchingType", searchingType);
		// 모델, searchingWord 저장
		model.addAttribute("searchingWord", searchingWord);		
		
		// --- paging ---
		// --- paging 변수 값 출력 ---
		String stringPageSelectedNum = request.getParameter("pageSelectedNum");
		// --- paging 변수 값 출력 ---
		System.out.println("--- paging 변수 값 출력 ---");
		System.out.println("stringPageSelectedNum: " + stringPageSelectedNum);
		System.out.println("------------------------------");		
		
		if(stringPageSelectedNum == null || stringPageSelectedNum.equals("/")) {
			stringPageSelectedNum = "0";
		}		
		
		int pageSelectedNum = Integer.parseInt(stringPageSelectedNum);	
		
		// 모델, pageSelectedNum 저장
		model.addAttribute("pageSelectedNum", pageSelectedNum);		
		
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
		
		// 댓글 개수 저장
		int replyNumber = dao.getOHPhotoReplyNumber(pb_no);
		
		// model 값 전달		
		model.addAttribute("replyNumber", replyNumber);	
		
		// 댓글 가져오기
		ArrayList<OHPhotoReply> dtoReplyList = dao.ohPhotoReplyView(pb_no);
		
		// model 값 전달
		model.addAttribute("dtoReplyList", dtoReplyList);	
		
		// OHPhotoReplyLike 객체 담을 리스트 선언
		ArrayList<OHPhotoReplyLike> ohPhotoReplyLike = null;
		
		// 로그인 사용자 => True, 좋아요 표시
		if(session.getAttribute("loginUserDto") != null) {
			// ohPhotoReplyLikeView() 함수 실행
			ohPhotoReplyLike = dao.ohPhotoReplyLikeView(memno);
			System.out.println("ohPhotoReplyLikeView() 함수 실행완료");
			System.out.println("------------------------------");
			
			// model <- ohPhotoLike, 로그인 사용자, 게시물 - 좋아요 표시
			model.addAttribute("ohPhotoReplyLike", ohPhotoReplyLike);	
		} else {
			System.out.println("비회원 입니다.");
			System.out.println("ohPhotoReplyLikeView() 함수 실행불가");
			System.out.println("------------------------------");
		}		
		
	}

}
