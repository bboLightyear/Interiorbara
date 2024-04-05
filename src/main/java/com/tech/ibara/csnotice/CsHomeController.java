package com.tech.ibara.csnotice;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tech.ibara.csnotice.dao.CsHomeIDao;
import com.tech.ibara.csnotice.dto.NoticeDto;
import com.tech.ibara.csnotice.service.CsHomeQnaNoticeService;
import com.tech.ibara.csnotice.service.CsHomeService;


@Controller
public class CsHomeController {

	@Autowired
	private SqlSession sqlSession;
	
	CsHomeService csHomeService;
	
	// 홈에서 고객센터로 이동하는 컨트롤러
	@RequestMapping("/cshome")
	public String cshome(HttpServletRequest request, Model model) {
		System.out.println("cshome()controller");
		
		model.addAttribute("request",request);
		
		csHomeService= new CsHomeQnaNoticeService(sqlSession);
		csHomeService.execute(model);
		
		return "csnotice/cshome";
	}//cshome
}
