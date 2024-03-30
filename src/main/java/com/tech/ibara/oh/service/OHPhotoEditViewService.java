package com.tech.ibara.oh.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.tech.ibara.oh.dao.OHInterfaceDao;
import com.tech.ibara.oh.dto.OHPhotoAttach;
import com.tech.ibara.oh.dto.OHPhotoBoard;

@Service
public class OHPhotoEditViewService implements OHInterfaceService {

	private SqlSession sqlSession;	
	
	public OHPhotoEditViewService(SqlSession sqlSession) {
		this.sqlSession = sqlSession;		
	}

	@Override
	public void execute(Model model) {
		System.out.println("OHPhotoEditViewService");	
		System.out.println("------------------------------");
		
		// Return the current set of model attributes as a Map.
		Map<String, Object> map = model.asMap();
		
		// request
		HttpServletRequest request = (HttpServletRequest) map.get("request");		
	
		// OHInterfaceDao, SqlSession 연결
		OHInterfaceDao dao = sqlSession.getMapper(OHInterfaceDao.class);		
		
		// pb_no 변수 선언, 값 저장		
		String pb_no = request.getParameter("pb_no");
		// pb_no 변수, 값 출력
		System.out.println("pb_no: " + pb_no);
		System.out.println("------------------------------");
		
		// getDtoOHPhotoBoard() 함수 실행
		OHPhotoBoard pb_dto = dao.getDtoOHPhotoBoard(pb_no);
		
		// model 값 전달
		model.addAttribute("pb_dto", pb_dto);
		
		// getDtoOHPhotoAttach() 함수 실행		
		ArrayList<OHPhotoAttach> pa_dto = dao.getDtoOHPhotoAttach(pb_no);
		
		// model 값 전달
		model.addAttribute("pa_dto", pa_dto);		
		
	}
	
}
