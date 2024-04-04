package com.tech.ibara.csnotice;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class CsChatController {
	
	//서비스 선언
//	QnaServiceInter qnaServiceInter;
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/chat")
	public String chat() {
		
		return "csnotice/chat";
	}
}
