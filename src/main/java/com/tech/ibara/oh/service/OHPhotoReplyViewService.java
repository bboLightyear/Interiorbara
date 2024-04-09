package com.tech.ibara.oh.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.google.gson.Gson;
import com.tech.ibara.oh.dao.OHInterfaceDao;
import com.tech.ibara.oh.dto.OHPhotoReply;

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
		
		// OHInterfaceDao, SqlSession 연결
		OHInterfaceDao dao = sqlSession.getMapper(OHInterfaceDao.class);
		
		// --- 변수 선언, 값 저장 ---		
		String pb_no = request.getParameter("pb_no");
		
		// --- 변수, 값 출력 ---		
		System.out.println("pb_no: " + pb_no);
		System.out.println("------------------------------");		
		
		// 게시물에 해당하는 댓글 가져오기
		ArrayList<OHPhotoReply> dtoList = dao.ohPhotoReplyView(pb_no);

		// Gson 객체 생성
		Gson gson = new Gson();
		
		// dtoList를 JSON Object 문자열로 반환
		String jsonDtoList = gson.toJson(dtoList);

		System.out.println("jsonDtoList: " + jsonDtoList);
		System.out.println("------------------------------");		
		
		// JSON 형식으로 응답을 생성
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = null;		
		try {
			out = response.getWriter();
			out.print(jsonDtoList);
			out.flush();
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		

	}

}
