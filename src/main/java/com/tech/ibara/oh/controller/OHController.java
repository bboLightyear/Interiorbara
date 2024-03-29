package com.tech.ibara.oh.controller;


import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tech.ibara.oh.service.OHInterfaceService;
import com.tech.ibara.oh.service.OHPhotoDeleteExecuteService;
import com.tech.ibara.oh.service.OHPhotoDetailViewService;
import com.tech.ibara.oh.service.OHPhotoEditExecuteService;
import com.tech.ibara.oh.service.OHPhotoEditViewService;
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
	public String OHMainView(HttpServletRequest request, Model model) {
		// Console 출력
		System.out.println("OHMainView Controller");
		
		/* MVC2 Model */
		
		return "oh/OHMainView";
	}
	// ---------- OHPhotoView.jsp ---------- 
	@RequestMapping("oh/OHPhotoView")
	public String OHPhotoView(HttpServletRequest request, Model model, OHPageVO ohPageVO) {
		// Console 출력
		System.out.println("OHPhotoView Controller");
		// Model
		model.addAttribute("request", request);
		model.addAttribute("ohPageVO", ohPageVO);
		// Service
		ohInterfaceService = new OHPhotoViewService(sqlSession);
		ohInterfaceService.execute(model);

		return "oh/OHPhotoView";
	}
	// ---------- OHPhotoWriteView.jsp ---------- 
	@RequestMapping("oh/OHPhotoWriteView")
	public String OHPhotoWriteView(HttpServletRequest request, Model model) {
		// Console 출력
		System.out.println("OHPhotoWriteView Controller");
		
		/* MVC2 Model */
		
		return "oh/OHPhotoWriteView";
	}
	// ---------- OHPhotoWriteExecute ---------- 
	@RequestMapping("oh/OHPhotoWriteExecute")
	public String OHPhotoWriteExecute(MultipartHttpServletRequest mftRequest, Model model) {
		// Console 출력
		System.out.println("OHPhotoWriteExecute Controller");
		// Model
		model.addAttribute("mftRequest", mftRequest);
		// Service
		ohInterfaceService = new OHPhotoWriteExecuteService(sqlSession);
		ohInterfaceService.execute(model);
		
		return "redirect:OHPhotoView";
	}
	// ---------- OHPhotoDetailView.jsp ---------- 
	@RequestMapping("oh/OHPhotoDetailView")
	public String OHPhotoDetailView(HttpServletRequest request, Model model) {
		// Console 출력
		System.out.println("OHPhotoDetailView Controller");
		// Model
		model.addAttribute("request", request);
		// Service
		ohInterfaceService = new OHPhotoDetailViewService(sqlSession);
		ohInterfaceService.execute(model);		
		
		return "oh/OHPhotoDetailView";
	}
	// ---------- OHPhotoEditView.jsp ----------
	@RequestMapping("oh/OHPhotoEditView")
	public String OHPhotoEditView(HttpServletRequest request, Model model) {
		// Console 출력
		System.out.println("OHPhotoEditView Controller");
		// Model
		model.addAttribute("request", request);
		// Service
		ohInterfaceService = new OHPhotoEditViewService(sqlSession);
		ohInterfaceService.execute(model);			
		
		return "oh/OHPhotoEditView";
	}
	// ---------- OHPhotoEditExecute ----------
	@RequestMapping("oh/OHPhotoEditExecute")
	public String OHPhotoEditExecute(MultipartHttpServletRequest mftRequest, Model model) {
		// Console 출력
		System.out.println("OHPhotoEditExecute Controller");
		// Model
		model.addAttribute("mftRequest", mftRequest);
		// Service
		ohInterfaceService = new OHPhotoEditExecuteService(sqlSession);
		ohInterfaceService.execute(model);		
		// 변수 선언, 값 저장
		String pb_no = mftRequest.getParameter("pb_no");		
		// 변수 값 출력
		System.out.println("pb_no: " + pb_no);			
		
		return "redirect:OHPhotoDetailView?pb_no=" + pb_no;
	}
	// ---------- OHPhotoDeleteExecute ----------
	@RequestMapping("oh/OHPhotoDeleteExecute")
	public String OHPhotoDeleteExecute(HttpServletRequest request, Model model) {
		// Console 출력
		System.out.println("OHPhotoDeleteExecute Controller");
		// Model
		model.addAttribute("request", request);
		// Service
		ohInterfaceService = new OHPhotoDeleteExecuteService(sqlSession);
		ohInterfaceService.execute(model);		
		
		return "redirect:OHPhotoView";
	}	

}






