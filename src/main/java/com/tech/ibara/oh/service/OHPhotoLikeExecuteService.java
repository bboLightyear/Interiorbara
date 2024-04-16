package com.tech.ibara.oh.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.tech.ibara.oh.dao.OHInterfaceDao;

@Service
public class OHPhotoLikeExecuteService implements OHInterfaceService {

	private SqlSession sqlSession;

	public OHPhotoLikeExecuteService(SqlSession sqlSession) {
		this.sqlSession = sqlSession;		
	}
	
	@Override
	public void execute(Model model) {
		System.out.println("OHPhotoLikeExecuteService");
		System.out.println("------------------------------");
		
		// Return the current set of model attributes as a Map.
		Map<String, Object> map = model.asMap();
		
		// request
		HttpServletRequest request = (HttpServletRequest) map.get("request");		
		
		// response
		HttpServletResponse response =  (HttpServletResponse) map.get("response");
		
		// OHInterfaceDao, SqlSession 연결
		OHInterfaceDao dao = sqlSession.getMapper(OHInterfaceDao.class);		
		
		// --- 변수 선언, 값 저장 ---		
		String memno = request.getParameter("memno");
		String pb_no = request.getParameter("pb_no");
		
		// --- 변수, 값 출력 ---		
		System.out.println("memno: " + memno);
		System.out.println("pb_no: " + pb_no);
		System.out.println("------------------------------");
		
		// likeCheck() 함수 실행 => 사용자가 해당 게시물에 좋아요를 눌렀는지 확인
		int likeCheckNum = dao.likeCheck(memno, pb_no);
		
		// --- 변수, 값 출력 ---			
		System.out.println("likeCheckNum: " + likeCheckNum);
		System.out.println("------------------------------");
		
		if(likeCheckNum == 0) {
			// 좋아요, 기록 없음
			dao.likeSave(memno, pb_no);
			System.out.println("좋아요, 기록 완료");
			System.out.println("------------------------------");
			dao.likeIncrease(pb_no);
			System.out.println("게시글 pb_like, 1 증가");
			System.out.println("------------------------------");
		} else {
			// 좋아요, 기록 있음
			dao.likeDelete(memno, pb_no);
			System.out.println("좋아요, 기록 삭제완료");
			System.out.println("------------------------------");
			dao.likeDecrease(pb_no);
			System.out.println("게시글 pb_like, 1 감소");
			System.out.println("------------------------------");
		}
		
		// 해당 게시글, 최신 좋아요 횟수, 변수 저장
		int likeNumber = dao.likeGetNumber(pb_no);
		
		// 해당 게시글, 최신 좋아요 횟수, 변수 출력
		System.out.println("likeNumber: " + likeNumber);
		System.out.println("------------------------------");
		
		// JSON 형식으로 응답을 생성
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			out.print("{\"likeNumber\": " + likeNumber + "}");
			out.flush();
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}	
	
}
