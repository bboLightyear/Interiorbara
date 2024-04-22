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
import com.tech.ibara.oh.dto.OHPhotoBoard;
import com.tech.ibara.oh.dto.OHPhotoLike;
import com.tech.ibara.oh.dto.OHPhotoScrap;
import com.tech.ibara.oh.vo.OHPageVO;

@Service
public class OHPhotoViewService implements OHInterfaceService {

	private SqlSession sqlSession;
	
	public OHPhotoViewService(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public void execute(Model model) {
		System.out.println("OHPhotoViewService");
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
		
		// --- sorting ---
		
		// --- sorting 변수 선언, 값 저장 ---
		String orderingBy = request.getParameter("orderingBy");
		String orderingMethod = request.getParameter("orderingMethod");
		
		// --- sorting 변수 값 출력 ---
		System.out.println("--- sorting 변수 값 출력 ---");
		System.out.println("orderingBy: " + orderingBy);
		System.out.println("orderingMethod: " + orderingMethod);
		System.out.println("------------------------------");
		
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
		
		// --- searching ---
		
		// --- searching 변수 값 출력 ---
		String searchingType = request.getParameter("searchingType");
		String searchingWord = request.getParameter("searchingWord");
		
		// --- searching 변수 값 출력 ---
		System.out.println("--- searching 변수 값 출력 ---");
		System.out.println("searchingType: " + searchingType);
		System.out.println("searchingWord: " + searchingWord);
		System.out.println("------------------------------");
		
		// 정렬기준 - orderingBy, null Check
		if(orderingBy == null || orderingBy.equals("/")) {
			orderingBy = "pb_date";
			System.out.println("orderingBy is null therefore assigned [pb_date] to it");
			System.out.println("------------------------------");
		}
		// 정렬기준 - orderingBy, model 저장, attributeName is keepOrderingBy		
		model.addAttribute("keepOrderingBy", orderingBy);
		
		// 정렬기준 - orderingMethod, null Check
		if(orderingMethod == null || orderingMethod.equals("/")) {
			orderingMethod = "desc";
			System.out.println("orderingMethod is null therefore assigned [desc] to it");
			System.out.println("------------------------------");
		}
		// 정렬기준 - orderingMethod, model 저장, attributeName is keepOrderingMethod		
		model.addAttribute("keepOrderingMethod", orderingMethod);						
		
		// 정렬기준 - pb_residence, null Check
		if(pb_residence == null || pb_residence.equals("/")) {
			pb_residence = "default";
			System.out.println("pb_residence is null therefore assigned [default] to it");
			System.out.println("------------------------------");
		}
		// 정렬기준 - pb_residence, model 저장, attributeName is keepPb_residence
		model.addAttribute("keepPb_residence", pb_residence);			
		
		// 정렬기준 - pb_room, null Check
		if(pb_room == null || pb_room.equals("/")) {
			pb_room = "default";
			System.out.println("pb_room is null therefore assigned [default] to it");
			System.out.println("------------------------------");
		}
		// 정렬기준 - pb_room, model 저장, attributeName is keepPb_room
		model.addAttribute("keepPb_room", pb_room);			

		// 정렬기준 - pb_style, null Check
		if(pb_style == null || pb_style.equals("/")) {
			pb_style = "default";
			System.out.println("pb_style is null therefore assigned [default] to it");
			System.out.println("------------------------------");
		}
		// 정렬기준 - pb_style, model 저장, attributeName is keepPb_style
		model.addAttribute("keepPb_style", pb_style);	
		
		// 정렬기준 - pb_skill, null Check
		if(pb_skill == null || pb_skill.equals("/")) {
			pb_skill = "default";
			System.out.println("pb_skill is null therefore assigned [default] to it");
			System.out.println("------------------------------");
		}
		// 정렬기준 - pb_skill, model 저장, attributeName is keepPb_skill
		model.addAttribute("keepPb_skill", pb_skill);			
		
		// 검색기준 - searchingType, null Check
		if(searchingType == null || searchingType.equals("/")) {
			searchingType = "default";
			System.out.println("searchingType is null therefore assigned [default] to it");
			System.out.println("------------------------------");
		}
		// 검색기준 - searchingType, model 저장, attributeName is keepSearchingType
		model.addAttribute("keepSearchingType", searchingType);
		
		// 검색어 - searchingWord, null Check, 검색어를 입력하지 않고 페이지 이동시 "/"가 입력란에 생기는 현상 때문에 조건 추가 
		if(searchingWord == null || searchingWord.equals("/")) {
			searchingWord = "";
			System.out.println("searchingWord is null therefore assigned [\"\"] to it");
			System.out.println("------------------------------");
		}
		// 검색어 - searchingWord, model 저장, attributeName is keepSearchingWord		
		model.addAttribute("keepSearchingWord", searchingWord);		
		
		// --- Paging ---
		
		// 선택한 현재 페이지 번호 가져오기
		String stringPageSelectedNum = request.getParameter("pageSelectedNum");
		System.out.println("stringPageSelectedNum: " + stringPageSelectedNum);
		System.out.println("------------------------------");
		// stringPageSelectedNum, null Check
		if(stringPageSelectedNum == null || stringPageSelectedNum.equals("0")) {
			stringPageSelectedNum = "1";
		}
		// stringPageSelectedNum 값, int 자료형으로 변환 후 저장
		int pageSelectedNum = Integer.parseInt(stringPageSelectedNum);
		// ohPageVO 객체, 현재 페이지 번호 저장
		ohPageVO.setPageSelectedNum(pageSelectedNum);
		// 전체 게시글 수, 검색에 적용할 변수
		int postTotalNum = 0;
		// getPostTotalCount() 함수 실행, (filtering, searching) 조건에 맞게 전체 게시글 수를 구한다.		
		postTotalNum = dao.getPostTotalCount(pb_residence, pb_room, pb_style, pb_skill,
					   						 searchingType, searchingWord);		
		// 전체 게시글 수, 출력
		System.out.println("postTotalNum: " + postTotalNum);
		System.out.println("------------------------------");
		
		// ohPageVO 객체, pageAndPostCalculate() 함수 실행
		ohPageVO.pageAndPostCalculate(postTotalNum);
		
		// ohPageVO 객체, 변수들 값 출력
		
		// 게시글 - Post
		System.out.println("--- 게시글 - Post ---");
		System.out.println("출력할 게시글 수, outputPostCount: " + ohPageVO.getOutputPostCount());
		System.out.println("전체 게시글 수, postTotalNum: " + ohPageVO.getPostTotalNum());
		System.out.println("시작 게시글 번호, postStartNum: " + ohPageVO.getPostStartNum());
		System.out.println("종료 게시글 번호, postEndNum: " + ohPageVO.getPostEndNum());
		System.out.println("------------------------------");
		
		// 페이지 - Page
		System.out.println("--- 페이지 - Page ---");
		System.out.println("페이지 그룹당 페이지 수, groupPageCount: " + ohPageVO.getGroupPageCount());
		System.out.println("전체 페이지 수, pageTotalNum: " + ohPageVO.getPageTotalNum());
		System.out.println("현재 페이지 번호, pageSelectedNum: " + ohPageVO.getPageSelectedNum());
		System.out.println("시작 페이지 번호, pageStartNum: " + ohPageVO.getPageStartNum());
		System.out.println("종료 페이지 번호, pageEndNum: " + ohPageVO.getPageEndNum());
		System.out.println("------------------------------");
		
		// 시작 게시글 번호, postStartNum
		int postStartNum = ohPageVO.getPostStartNum();
		
		// 종료 게시글 번호, postEndNum		
		int postEndNum = ohPageVO.getPostEndNum();		
		
		// dtoList, 게시판에 나타낼 게시글 담을 변수선언, ohPhotoView() 함수 실행
		ArrayList<OHPhotoBoard> dtoList = dao.ohPhotoView(postStartNum, postEndNum, 
														  orderingBy, orderingMethod,														  
														  pb_residence, pb_room, pb_style, pb_skill,
														  searchingType, searchingWord);			
		
		// model <- dtoList, 게시판에 나타낼 게시글 담을 변수
		model.addAttribute("ohPhotoView", dtoList);
		
		// model <- ohPageVO, Paging 기능에 사용
		model.addAttribute("ohPageVO", ohPageVO);	
		
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
		ArrayList<OHPhotoLike> ohPhotoLike = null;
		
		// OHPhotoScrap 객체 담을 리스트 선언
		ArrayList<OHPhotoScrap> ohPhotoScrap = null;
		
		// 로그인 사용자 => True, 좋아요, 스크랩 표시
		if(session.getAttribute("loginUserDto") != null) {
			// ohPhotoLikeView() 함수 실행
			ohPhotoLike = dao.ohPhotoLikeView(memno);
			System.out.println("ohPhotoLikeView() 함수 실행완료");
			System.out.println("------------------------------");
			
			// model <- ohPhotoLike, 로그인 사용자, 게시물 - 좋아요 표시
			model.addAttribute("ohPhotoLike", ohPhotoLike);
			
			// ohPhotoScrapView() 함수 실행
			ohPhotoScrap = dao.ohPhotoScrapView(memno);
			System.out.println("ohPhotoScrapView() 함수 실행완료");
			System.out.println("------------------------------");
			
			// model <- ohPhotoScrap, 로그인 사용자, 게시물 - 스크랩 표시
			model.addAttribute("ohPhotoScrap", ohPhotoScrap);			
		} else {
			System.out.println("비회원 입니다.");
			System.out.println("ohPhotoLikeView() 함수 실행불가");
			System.out.println("ohPhotoScrapView() 함수 실행불가");
			System.out.println("------------------------------");
		}
		
	}
	
}
