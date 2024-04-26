package com.tech.ibara.oh.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.oh.dao.OHInterfaceDao;
import com.tech.ibara.oh.dto.OHPhotoBoard;

public class OHMainViewService implements OHInterfaceService {

	private SqlSession sqlSession;
	
	public OHMainViewService(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}	
	
	@Override
	public void execute(Model model) {
		System.out.println("OHMainViewService");
		System.out.println("------------------------------");
		
		// Return the current set of model attributes as a Map.
		Map<String, Object> map = model.asMap();
		
		// request
		HttpServletRequest request = (HttpServletRequest) map.get("request");		
		
		// OHInterfaceDao, SqlSession 연결
		OHInterfaceDao dao = sqlSession.getMapper(OHInterfaceDao.class);	
		
		// 보여줄 집사진 게시물 수 => 4개
		int number = 4;
		
		// ohMainPhotoViewOrderDate() 함수 실행, 집사진 게시물 최신순 - PB_NO DESC
		ArrayList<OHPhotoBoard> dtoListOrderDate = dao.ohMainPhotoViewOrderDate(number);

		// model <- dtoListOrderDate, 게시판에 나타낼 게시글 담을 변수
		model.addAttribute("ohPhotoViewOrderDate", dtoListOrderDate);		
		
		// ohMainPhotoViewOrderLike() 함수 실행, 집사진 게시물 인기순 - PB_LIKE DESC
		ArrayList<OHPhotoBoard> dtoListOrderLike = dao.ohMainPhotoViewOrderLike(number);
		
		// model <- dtoListOrderLike, 게시판에 나타낼 게시글 담을 변수
		model.addAttribute("ohPhotoViewOrderLike", dtoListOrderLike);			
		
		// ohMainPhotoViewOrderHit() 함수 실행, 집사진 게시물 최신순 - PB_HIT DESC
		ArrayList<OHPhotoBoard> dtoListOrderHit = dao.ohMainPhotoViewOrderHit(number);
		
		// model <- dtoListOrderLike, 게시판에 나타낼 게시글 담을 변수
		model.addAttribute("ohPhotoViewOrderHit", dtoListOrderHit);	
		
	}
	
}
