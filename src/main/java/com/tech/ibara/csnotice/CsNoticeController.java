package com.tech.ibara.csnotice;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class CsNoticeController {
	
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/noticelist")
	public String noticelist() {
		
		return "csnotice/noticelist";
	}
	
}
