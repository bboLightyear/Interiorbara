package com.tech.ibara.oh.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.google.gson.Gson;
import com.tech.ibara.my.dto.MyMemberInfoDto;
import com.tech.ibara.oh.dao.OHInterfaceDao;
import com.tech.ibara.oh.dto.OHPhotoReply;
import com.tech.ibara.oh.dto.OHPhotoReplyLike;

public class OHPhotoReplyViewService implements OHInterfaceService {

	private SqlSession sqlSession;

	public OHPhotoReplyViewService(SqlSession sqlSession) {
		this.sqlSession = sqlSession;		
	}	
	
	@Override
	public void execute(Model model) {
		System.out.println("OHPhotoReplyViewService");
		System.out.println("------------------------------");
		
		// Return the current set of model attributes as a Map.
		Map<String, Object> map = model.asMap();		
		
		// request
		HttpServletRequest request = (HttpServletRequest) map.get("request");		
		
		// response
		HttpServletResponse response =  (HttpServletResponse) map.get("response");
		
		// session
		HttpSession session = (HttpSession) map.get("session");			
		
		// OHInterfaceDao, SqlSession 연결
		OHInterfaceDao dao = sqlSession.getMapper(OHInterfaceDao.class);
		
		// --- 변수 선언, 값 저장 ---		
		String pb_no = request.getParameter("pb_no");
		
		// --- 변수, 값 출력 ---		
		System.out.println("pb_no: " + pb_no);
		System.out.println("------------------------------");		
		
		// 로그인 사용자
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
		
		// 게시물에 해당하는 댓글 가져오기
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
		
// ------------------------------------------------		
// 아래의 코드는 댓글 리스트를 전달 받아서 자바스크립트로 for문을 실행한다.
// 그래서 HTML 태그 영역에 태그를 만들어서 추가하기 위해서 사용했다.
// ------------------------------------------------		
//		// Gson 객체 생성
//		Gson gson = new Gson();
//		
//		// dtoList를 JSON Object 문자열로 반환
//		String dtoReplyListString = gson.toJson(dtoReplyList);
//
//		System.out.println("dtoReplyListString: " + dtoReplyListString);
//		System.out.println("------------------------------");		
//		
//		// JSON 형식으로 응답을 생성
//		response.setContentType("application/json");
//		response.setCharacterEncoding("UTF-8");
//		PrintWriter out = null;		
//		try {
//			out = response.getWriter();
//			out.print(dtoReplyListString);
//			out.flush();
//			out.close();
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}		

	}

}
