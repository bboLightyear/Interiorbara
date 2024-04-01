package com.tech.ibara.main.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tech.ibara.main.service.BizPreviewService;
import com.tech.ibara.main.service.MainDataService;
import com.tech.ibara.main.service.NoticePreviewService;
import com.tech.ibara.main.service.OHPreviewService;
import com.tech.ibara.main.service.QnAPreviewService;
import com.tech.ibara.main.service.ShopPreviewService;

@Controller
public class MainController {
	
	@Autowired
	private SqlSession sqlSession;
	
	private MainDataService bizDataService;
	private MainDataService ohDataService;
	private MainDataService shopDataService;
	private MainDataService noticeDataService;
	private MainDataService qnaDataService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		
		bizDataService=new BizPreviewService(sqlSession);
		bizDataService.execute(model);
		
		ohDataService=new OHPreviewService(sqlSession);
		ohDataService.execute(model);
		
		shopDataService=new ShopPreviewService(sqlSession);
		shopDataService.execute(model);
		
		noticeDataService=new NoticePreviewService(sqlSession);
		noticeDataService.execute(model);
		
		qnaDataService=new QnAPreviewService(sqlSession);
		qnaDataService.execute(model);
		
		return "main/main";
	}
	
	@RequestMapping("mainSearchView")
	public String mainSearchView() {
		
		return "main/mainSearchView";
	}
}