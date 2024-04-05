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

public class CsQnaContentService implements CsQnaService {

	CsQnaService csQnaService;
	
	private SqlSession sqlSession;
	
	public CsQnaContentService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	
	@Override
	public void execute(Model model) {
		
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		QnaBoardIDao dao = sqlSession.getMapper(QnaBoardIDao.class);

		String qbno = request.getParameter("qbno");
		String rqbno = request.getParameter("rqbno");
		System.out.println(qbno);
		System.out.println(rqbno);

		// 글 번호로 조회수 올리기
		dao.uphit(qbno);

		// 콘탠트 조회 후 dto에 담기
		QnaDto dto = dao.qnacontent(qbno);
		// model에 담아서 뷰단에 보내줌
		model.addAttribute("qna_content", dto);

		// 답글 셀렉트 해서 출력
		ArrayList<QnaReplyDto> replylist = dao.replylist(qbno);
		System.out.println("replylist : " + replylist);
		model.addAttribute("replylist", replylist);

		// 답글 갯수 셀렉트
		int replycnt = dao.replycnt(qbno);
		System.out.println("replycnt : " + replycnt);
		model.addAttribute("replycnt", replycnt);

		// 이미지 출력을 위한 파일코드 검색
		Integer selfilecode = dao.selfilecode(qbno);
		System.out.println("selfilecode :" + selfilecode);

		// 파일코드로 이미지 조회 후 모델에 담아 뷰에 전송
		if (selfilecode!=null) {
			ArrayList<QnaImgDto> imglist = dao.imglist(selfilecode);
			System.out.println("imglist : " + imglist);
			model.addAttribute("imglist", imglist);			
		}

	}
}
