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

@Controller
public class MainController {
	
	@Autowired
	private SqlSession sqlSession;
	
	private MainDataService mainDataService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		
		mainDataService=new BizPreviewService(sqlSession);
		mainDataService.execute(model);
		
		return "main/main";
	}
	
	@RequestMapping("mainSearchView")
	public String mainSearchView() {
		
		return "main/mainSearchView";
	}
}