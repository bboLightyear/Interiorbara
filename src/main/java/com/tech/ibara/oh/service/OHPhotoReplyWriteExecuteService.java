package com.tech.ibara.oh.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.oh.dao.OHInterfaceDao;

public class OHPhotoReplyWriteExecuteService implements OHInterfaceService {

	private SqlSession sqlSession;

	public OHPhotoReplyWriteExecuteService(SqlSession sqlSession) {
		this.sqlSession = sqlSession;		
	}

	@Override
	public void execute(Model model) {
		System.out.println("OHPhotoReplyWriteExecuteService");
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
		String pr_content = request.getParameter("pr_content");
		String pb_no = request.getParameter("pb_no");
		
		// --- 변수, 값 출력 ---
		System.out.println("memno: " + memno);
		System.out.println("pr_content: " + pr_content);
		System.out.println("pb_no: " + pb_no);
		System.out.println("------------------------------");
		
		// 댓글 - DB 저장
		dao.ohPhotoReplyWriteExecute(memno, pr_content, pb_no);	
		
		// OH_PHOTO_BOARD - PB_REPLY, 댓글수 1증가
		dao.ohPhotoReplyIncrease(pb_no);
		
		// 해당 게시글, 총 댓글수, 변수 저장
		int replyNumber = dao.ohPhotoReplyGetNumber(pb_no);
		
		// 해당 게시글, 총 댓글수, 변수 저장
		System.out.println("replyNumber: " + replyNumber);
		System.out.println("------------------------------");
		
		// JSON 형식으로 응답을 생성
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			out.print("{\"replyNumber\": " + replyNumber + "}");
			out.flush();
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		
	}	
	
}
