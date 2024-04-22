package com.tech.ibara.main.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tech.ibara.main.service.BizPreviewService;
import com.tech.ibara.main.service.BizSearchService;
import com.tech.ibara.main.service.MainDataService;
import com.tech.ibara.main.service.MainSearchService;
import com.tech.ibara.main.service.NoticePreviewService;
import com.tech.ibara.main.service.NoticeSearchService;
import com.tech.ibara.main.service.OHPreviewService;
import com.tech.ibara.main.service.OHSearchService;
import com.tech.ibara.main.service.QnAPreviewService;
import com.tech.ibara.main.service.QnASearchService;
import com.tech.ibara.main.service.ShopPreviewService;
import com.tech.ibara.main.service.ShopSearchService;

@Controller
public class MainController {
	
	@Autowired
	private SqlSession sqlSession;
	
	private MainDataService bizDataService;
	private MainDataService ohDataService;
	private MainDataService shopDataService;
	private MainDataService noticeDataService;
	private MainDataService qnaDataService;
	
	@RequestMapping("/")
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
	
	@RequestMapping("main")
	public String Home(HttpServletRequest request, Model model) {
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
		
		return "redirect:/";
	}
	
	private MainSearchService bizSearchService;
	private MainSearchService ohSearchService;
	private MainSearchService shopSearchService;
	private MainSearchService noticeSearchService;
	private MainSearchService qnaSearchService;
	
	@RequestMapping("mainSearchView")
	public String mainSearchView(HttpServletRequest request, Model model) {
		
		model.addAttribute("request", request);
		
		bizSearchService=new BizSearchService(sqlSession);
		bizSearchService.execute(model);
		
		ohSearchService=new OHSearchService(sqlSession);
		ohSearchService.execute(model);
		
		shopSearchService=new ShopSearchService(sqlSession);
		shopSearchService.execute(model);
		
		noticeSearchService=new NoticeSearchService(sqlSession);
		noticeSearchService.execute(model);
		
		qnaSearchService=new QnASearchService(sqlSession);
		qnaSearchService.execute(model);
		
		return "main/mainSearchView";
	}
	
	@RequestMapping("searchView")
	public String SearchView(HttpServletRequest request, Model model) {

		model.addAttribute("request", request);
		
		bizSearchService=new BizSearchService(sqlSession);
		bizSearchService.execute(model);
		
		ohSearchService=new OHSearchService(sqlSession);
		ohSearchService.execute(model);
		
		shopSearchService=new ShopSearchService(sqlSession);
		shopSearchService.execute(model);
		
		noticeSearchService=new NoticeSearchService(sqlSession);
		noticeSearchService.execute(model);
		
		qnaSearchService=new QnASearchService(sqlSession);
		qnaSearchService.execute(model);
		
		return "main/mainSearchView";
	}
}