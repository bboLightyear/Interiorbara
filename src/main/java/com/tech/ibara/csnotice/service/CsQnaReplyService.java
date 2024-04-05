package com.tech.ibara.csnotice.service;

import java.io.File;
import java.util.ArrayList;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import com.tech.ibara.csnotice.dao.QnaBoardIDao;
import com.tech.ibara.csnotice.dto.QnaDto;
import com.tech.ibara.csnotice.vo.SearchVO;

public class CsQnaReplyService implements CsQnaService {

	private SqlSession sqlSession;

	public CsQnaReplyService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}

	@Override
	public void execute(Model model) {

		Map<String, Object> map=model.asMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");

		QnaBoardIDao dao = sqlSession.getMapper(QnaBoardIDao.class);

		String qbno = request.getParameter("qbno");
		String qnareply = request.getParameter("qnareply");
		String qnarewriter = request.getParameter("qnarewriter");

		// 전체 답글 달기
		dao.qnareply(qbno, qnareply, qnarewriter);
	}
}
