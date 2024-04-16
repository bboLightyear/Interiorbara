package com.tech.ibara.oh.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.oh.dao.OHInterfaceDao;

public class OHPhotoScrapExecuteService implements OHInterfaceService {

	private SqlSession sqlSession;	
	
	public OHPhotoScrapExecuteService(SqlSession sqlSession) {
		this.sqlSession = sqlSession;			
	}
	
	@Override
	public void execute(Model model) {
		System.out.println("OHPhotoScrapExecuteService");
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
		
		// scrapCheck() 함수 실행 => 사용자가 해당 게시물에 스크랩을 눌렀는지 확인
		int scrapCheckNum = dao.scrapCheck(memno, pb_no);		
		
		// --- 변수, 값 출력 ---			
		System.out.println("scrapCheckNum: " + scrapCheckNum);
		System.out.println("------------------------------");		
		
		if(scrapCheckNum == 0) {
			// 스크랩, 기록 없음
			dao.scrapSave(memno, pb_no);
			System.out.println("스크랩, 기록 완료");
			System.out.println("------------------------------");
			dao.scrapIncrease(pb_no);
			System.out.println("게시글 pb_scrap, 1 증가");
			System.out.println("------------------------------");
		} else {
			// 스크랩, 기록 있음
			dao.scrapDelete(memno, pb_no);
			System.out.println("스크랩, 기록 삭제완료");
			System.out.println("------------------------------");
			dao.scrapDecrease(pb_no);
			System.out.println("게시글 pb_scrap, 1 감소");
			System.out.println("------------------------------");
		}
		
		// 해당 게시글, 최신 스크랩 횟수, 변수 저장
		int scrapNumber = dao.scrapGetNumber(pb_no);
		// 해당 게시글, 최신 스크랩 횟수, 변수 출력
		System.out.println("scrapNumber: " + scrapNumber);
		System.out.println("------------------------------");
		// JSON 형식으로 응답을 생성
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			out.print("{\"scrapNumber\": " + scrapNumber + "}");
			out.flush();
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		
	}

}
