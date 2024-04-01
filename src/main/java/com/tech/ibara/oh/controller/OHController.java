package com.tech.ibara.oh.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tech.ibara.oh.service.OHInterfaceService;
import com.tech.ibara.oh.service.OHPhotoDeleteExecuteService;
import com.tech.ibara.oh.service.OHPhotoDetailViewService;
import com.tech.ibara.oh.service.OHPhotoEditExecuteService;
import com.tech.ibara.oh.service.OHPhotoEditViewService;
import com.tech.ibara.oh.service.OHPhotoLikeExecuteService;
import com.tech.ibara.oh.service.OHPhotoViewService;
import com.tech.ibara.oh.service.OHPhotoWriteExecuteService;
import com.tech.ibara.oh.vo.OHPageVO;

@Controller
public class OHController {
	
	OHInterfaceService ohInterfaceService;
	
	@Autowired
	private SqlSession sqlSession;
	
	// ---------- OHMainView.jsp ---------- 
	@RequestMapping("oh/OHMainView")
	public String OHMainView(HttpServletRequest request, HttpSession session,  Model model) {
		// Console 출력
		System.out.println("OHMainView Controller");
		System.out.println("------------------------------");
		
		// 임시 session 내장객체 설정 - 사용자 ID
		session.setAttribute("userId", "KimGyeongTae");
		// session - null Check, userID 출력 
		if(session.getAttribute("userId") != null) {
			System.out.println("userId: " + session.getAttribute("userId"));
			System.out.println("------------------------------");
		} else {
			System.out.println("userId: " + session.getAttribute("userId"));
			System.out.println("------------------------------");
		}		
		
		// MVC2 Model 
		
		return "oh/OHMainView";
	}
	// ---------- OHPhotoView.jsp ---------- 
	@RequestMapping("oh/OHPhotoView")
	public String OHPhotoView(HttpServletRequest request, HttpSession session, Model model, OHPageVO ohPageVO) {
		// Console 출력
		System.out.println("OHPhotoView Controller");
		System.out.println("------------------------------");
		
		// Model - request
		model.addAttribute("request", request);
		// Model - ohPageVO
		model.addAttribute("ohPageVO", ohPageVO);
		// Model - session
		model.addAttribute("session", session);		
		
		// Service
		ohInterfaceService = new OHPhotoViewService(sqlSession);
		ohInterfaceService.execute(model);	

		return "oh/OHPhotoView";
	}
	// ---------- OHPhotoLikeExecute ---------- 	
	@RequestMapping("oh/OHPhotoLikeExecute")
	@ResponseBody
	public void OHPhotoLikeExecute(HttpServletRequest request, HttpServletResponse response, HttpSession session,  Model model) {
		// Console 출력
		System.out.println("OHPhotoLikeExecute Controller");
		System.out.println("------------------------------");	
		
		// Model - request
		model.addAttribute("request", request);		
		// Model - response		
		model.addAttribute("response", response);
		
		// Service
		ohInterfaceService = new OHPhotoLikeExecuteService(sqlSession);
		ohInterfaceService.execute(model);			
	}
	// ---------- OHPhotoWriteView.jsp ---------- 
	@RequestMapping("oh/OHPhotoWriteView")
	public String OHPhotoWriteView(HttpServletRequest request, HttpSession session, Model model) {
		// Console 출력
		System.out.println("OHPhotoWriteView Controller");
		System.out.println("------------------------------");
		
		// MVC2 Model
		
		return "oh/OHPhotoWriteView";
	}
	// ---------- OHPhotoWriteExecute ---------- 
	@RequestMapping("oh/OHPhotoWriteExecute")
	public String OHPhotoWriteExecute(MultipartHttpServletRequest mftRequest, HttpSession session, Model model) {
		// Console 출력
		System.out.println("OHPhotoWriteExecute Controller");
		System.out.println("------------------------------");
		
		// Model - mftRequest
		model.addAttribute("mftRequest", mftRequest);
		// Model - session
		model.addAttribute("session", session);
		
		// Service
		ohInterfaceService = new OHPhotoWriteExecuteService(sqlSession);
		ohInterfaceService.execute(model);
		
		return "redirect:OHPhotoView";
	}
	// ---------- OHPhotoDetailView.jsp ---------- 
	@RequestMapping("oh/OHPhotoDetailView")
	public String OHPhotoDetailView(HttpServletRequest request, HttpSession session, Model model) {
		// Console 출력
		System.out.println("OHPhotoDetailView Controller");
		System.out.println("------------------------------");
		
		// Model - request
		model.addAttribute("request", request);
		
		// Service
		ohInterfaceService = new OHPhotoDetailViewService(sqlSession);
		ohInterfaceService.execute(model);		
		
		return "oh/OHPhotoDetailView";
	}
	// ---------- OHPhotoEditView.jsp ----------
	@RequestMapping("oh/OHPhotoEditView")
	public String OHPhotoEditView(HttpServletRequest request, HttpSession session, Model model) {
		// Console 출력
		System.out.println("OHPhotoEditView Controller");
		System.out.println("------------------------------");
		
		// Model - request
		model.addAttribute("request", request);
		
		// Service
		ohInterfaceService = new OHPhotoEditViewService(sqlSession);
		ohInterfaceService.execute(model);			
		
		return "oh/OHPhotoEditView";
	}
	// ---------- OHPhotoEditExecute ----------
	@RequestMapping("oh/OHPhotoEditExecute")
	public String OHPhotoEditExecute(MultipartHttpServletRequest mftRequest, HttpSession session, Model model) {
		// Console 출력
		System.out.println("OHPhotoEditExecute Controller");
		System.out.println("------------------------------");
		
		// Model - mftRequest
		model.addAttribute("mftRequest", mftRequest);
		
		// Service
		ohInterfaceService = new OHPhotoEditExecuteService(sqlSession);
		ohInterfaceService.execute(model);
		
		// pb_no 변수 선언, 값 저장
		String pb_no = mftRequest.getParameter("pb_no");		
		// pb_no 변수, 값 출력
		System.out.println("pb_no: " + pb_no);	
		System.out.println("------------------------------");
		
		return "redirect:OHPhotoDetailView?pb_no=" + pb_no;
	}
	// ---------- OHPhotoDeleteExecute ----------
	@RequestMapping("oh/OHPhotoDeleteExecute")
	public String OHPhotoDeleteExecute(HttpServletRequest request, HttpSession session, Model model) {
		// Console 출력
		System.out.println("OHPhotoDeleteExecute Controller");
		System.out.println("------------------------------");
		
		// Model - request
		model.addAttribute("request", request);
		
		// Service
		ohInterfaceService = new OHPhotoDeleteExecuteService(sqlSession);
		ohInterfaceService.execute(model);		
		
		return "redirect:OHPhotoView";
	}	

}






