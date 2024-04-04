package com.tech.ibara.oh.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
		
		// OHInterfaceDao, SqlSession 연결
		OHInterfaceDao dao = sqlSession.getMapper(OHInterfaceDao.class);
		
		// --- 변수 선언, 값 저장 ---		
		String userId = request.getParameter("userId");
		String pr_content = request.getParameter("pr_content");
		String pb_no = request.getParameter("pb_no");
		
		// --- 변수, 값 출력 ---
		System.out.println("userId: " + userId);
		System.out.println("pr_content: " + pr_content);
		System.out.println("pb_no: " + pb_no);
		System.out.println("------------------------------");
		
		// 댓글 - DB 저장
		dao.ohPhotoReplyWriteExecute(userId, pr_content, pb_no);		
	}	
	
}
