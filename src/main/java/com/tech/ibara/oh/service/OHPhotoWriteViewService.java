package com.tech.ibara.oh.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

public class OHPhotoWriteViewService implements OHInterfaceService {

	private SqlSession sqlSession;
	
	public OHPhotoWriteViewService(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}	
	
	@Override
	public void execute(Model model) {
		System.out.println("OHPhotoWriteViewService");		
		System.out.println("------------------------------");		
		
		// Return the current set of model attributes as a Map.
		Map<String, Object> map = model.asMap();	
		
		// request
		HttpServletRequest request = (HttpServletRequest) map.get("request");		
		
		// pb_no 변수 선언, 값 저장		
		String pb_no = request.getParameter("pb_no");
		// pb_no 변수, 값 출력
		System.out.println("pb_no: " + pb_no);
		System.out.println("------------------------------");
		
		// 모델, pb_no 저장
		model.addAttribute("pb_no", pb_no);		
		
		// --- sorting ---
		// --- sorting 변수 선언, 값 저장 ---
		String orderingBy = request.getParameter("orderingBy");
		String orderingMethod = request.getParameter("orderingMethod");
		// --- sorting 변수 값 출력 ---
		System.out.println("--- sorting 변수 값 출력 ---");
		System.out.println("orderingBy: " + orderingBy);
		System.out.println("orderingMethod: " + orderingMethod);
		System.out.println("------------------------------");		
		
		// 모델, orderingBy 저장
		model.addAttribute("orderingBy", orderingBy);
		// 모델, orderingMethod 저장
		model.addAttribute("orderingMethod", orderingMethod);
		
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
		
		// 모델, pb_residence 저장
		model.addAttribute("pb_residence", pb_residence);
		// 모델, pb_room 저장
		model.addAttribute("pb_room", pb_room);
		// 모델, pb_style 저장
		model.addAttribute("pb_style", pb_style);
		// 모델, pb_skill 저장
		model.addAttribute("pb_skill", pb_skill);		
		
		// --- searching ---
		// --- searching 변수 값 출력 ---
		String searchingType = request.getParameter("searchingType");
		String searchingWord = request.getParameter("searchingWord");
		// --- searching 변수 값 출력 ---
		System.out.println("--- searching 변수 값 출력 ---");
		System.out.println("searchingType: " + searchingType);
		System.out.println("searchingWord: " + searchingWord);
		System.out.println("------------------------------");		
		
		// 모델, searchingType 저장
		model.addAttribute("searchingType", searchingType);
		// 모델, searchingWord 저장
		model.addAttribute("searchingWord", searchingWord);		
		
		// --- paging ---
		// --- paging 변수 값 출력 ---
		String stringPageSelectedNum = request.getParameter("pageSelectedNum");
		// --- paging 변수 값 출력 ---
		System.out.println("--- paging 변수 값 출력 ---");
		System.out.println("stringPageSelectedNum: " + stringPageSelectedNum);
		System.out.println("------------------------------");		
		
		if(stringPageSelectedNum == null || stringPageSelectedNum.equals("/")) {
			stringPageSelectedNum = "0";
		}		
		
		int pageSelectedNum = Integer.parseInt(stringPageSelectedNum);
		
		// 모델, pageSelectedNum 저장
		model.addAttribute("pageSelectedNum", pageSelectedNum);	
		
	}

}
