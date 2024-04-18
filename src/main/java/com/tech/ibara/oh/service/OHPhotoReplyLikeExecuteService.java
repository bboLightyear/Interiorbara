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
public class OHPhotoReplyLikeExecuteService implements OHInterfaceService {

	private SqlSession sqlSession;

	public OHPhotoReplyLikeExecuteService(SqlSession sqlSession) {
		this.sqlSession = sqlSession;	
	}

	@Override
	public void execute(Model model) {
		System.out.println("OHPhotoReplyLikeExecuteService");
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
		String pr_no = request.getParameter("pr_no");
		
		// --- 변수, 값 출력 ---		
		System.out.println("memno: " + memno);
		System.out.println("pr_no: " + pr_no);
		System.out.println("------------------------------");
		
		// likeCheck() 함수 실행 => 사용자가 해당 게시물에 좋아요를 눌렀는지 확인
		int likeCheckNum = dao.replyLikeCheck(memno, pr_no);
		
		// --- 변수, 값 출력 ---			
		System.out.println("likeCheckNum: " + likeCheckNum);
		System.out.println("------------------------------");
		
		if(likeCheckNum == 0) {
			// 좋아요, 기록 없음
			dao.replyLikeSave(memno, pr_no);
			System.out.println("좋아요, 기록 완료");
			System.out.println("------------------------------");
			dao.replyLikeIncrease(pr_no);
			System.out.println("댓글 pr_like, 1 증가");
			System.out.println("------------------------------");
		} else {
			// 좋아요, 기록 있음
			dao.replyLikeDelete(memno, pr_no);
			System.out.println("좋아요, 기록 삭제완료");
			System.out.println("------------------------------");
			dao.replyLikeDecrease(pr_no);
			System.out.println("댓글 pr_like, 1 감소");
			System.out.println("------------------------------");
		}
		
		// 해당 게시글, 최신 좋아요 횟수, 변수 저장
		int likeNumber = dao.replyLikeGetNumber(pr_no);		
		
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