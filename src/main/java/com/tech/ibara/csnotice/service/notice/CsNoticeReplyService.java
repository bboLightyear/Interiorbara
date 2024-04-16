package com.tech.ibara.csnotice.service.notice;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.csnotice.dao.NoticeBoardIDao;

public class CsNoticeReplyService implements CsNoticeService {

	private SqlSession sqlSession;

	public CsNoticeReplyService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}

	@Override
	public void execute(Model model) {

		Map<String, Object> map=model.asMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");

		NoticeBoardIDao dao = sqlSession.getMapper(NoticeBoardIDao.class);

		String nbno = request.getParameter("nbno");
		String noticereply = request.getParameter("noticereply");
		String noticerewriter = request.getParameter("noticerewriter");

		// 전체 답글 달기
		dao.noticereply(nbno, noticereply, noticerewriter);
	}
}
