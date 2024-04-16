package com.tech.ibara.csnotice.service.notice;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.csnotice.dao.NoticeBoardIDao;
import com.tech.ibara.csnotice.dto.NoticeDto;
import com.tech.ibara.csnotice.dto.NoticeImgDto;

public class CsNoticeContentEditService implements CsNoticeService {

	CsNoticeService csNoticeService;
	
	private SqlSession sqlSession;
	
	public CsNoticeContentEditService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	
	@Override
	public void execute(Model model) {
		
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
	
		String nbno = request.getParameter("nbno");
		System.out.println("nbno: " + nbno);

		NoticeBoardIDao dao = sqlSession.getMapper(NoticeBoardIDao.class);

		NoticeDto notice = dao.noticecontent(nbno);

		ArrayList<NoticeImgDto> noticeimg = dao.noticecontentimgview(nbno);

		model.addAttribute("notice_content", notice);
		model.addAttribute("noticeimg", noticeimg);

		System.out.println("nbno: " + nbno);

	}
}
