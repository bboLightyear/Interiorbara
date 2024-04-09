package com.tech.ibara.csnotice.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.csnotice.dao.QnaBoardIDao;
import com.tech.ibara.csnotice.dto.QnaDto;
import com.tech.ibara.csnotice.dto.QnaImgDto;
import com.tech.ibara.csnotice.dto.QnaReplyDto;

public class CsQnaContentEditService implements CsQnaService {

	CsQnaService csQnaService;
	
	private SqlSession sqlSession;
	
	public CsQnaContentEditService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	
	@Override
	public void execute(Model model) {
		
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
	
		String qbno = request.getParameter("qbno");
		System.out.println("qbno: " + qbno);

		QnaBoardIDao dao = sqlSession.getMapper(QnaBoardIDao.class);

		QnaDto qna = dao.qnacontent(qbno);

		ArrayList<QnaImgDto> qnaimg = dao.qnacontentimgview(qbno);

		model.addAttribute("qna_content", qna);
		model.addAttribute("qnaimg", qnaimg);

		System.out.println("qbno: " + qbno);

	}
}
