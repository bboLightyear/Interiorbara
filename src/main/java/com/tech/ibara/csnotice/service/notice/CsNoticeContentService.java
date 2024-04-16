package com.tech.ibara.csnotice.service.notice;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.csnotice.dao.NoticeBoardIDao;
import com.tech.ibara.csnotice.dto.NoticeDto;
import com.tech.ibara.csnotice.dto.NoticeImgDto;
import com.tech.ibara.csnotice.dto.NoticeReplyDto;

public class CsNoticeContentService implements CsNoticeService {

	CsNoticeService csNoticeService;
	
	private SqlSession sqlSession;
	
	public CsNoticeContentService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	
	@Override
	public void execute(Model model) {
		
		Map<String, Object> map=model.asMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		NoticeBoardIDao dao = sqlSession.getMapper(NoticeBoardIDao.class);

		String nbno = request.getParameter("nbno");
		String rnbno = request.getParameter("rnbno");
		System.out.println("nbno :"+nbno);
		System.out.println("rnbno :"+rnbno);

		// 글 번호로 조회수 올리기
		dao.uphit(nbno);

		// 콘탠트 조회 후 dto에 담기
		NoticeDto dto = dao.noticecontent(nbno);
		// model에 담아서 뷰단에 보내줌
		model.addAttribute("notice_content", dto);

		// 답글 셀렉트 해서 출력
		ArrayList<NoticeReplyDto> replylist = dao.replylist(nbno);
		System.out.println("replylist : " + replylist);
		model.addAttribute("replylist", replylist);

		// 답글 갯수 셀렉트
		int replycnt = dao.replycnt(nbno);
		System.out.println("replycnt : " + replycnt);
		model.addAttribute("replycnt", replycnt);

		// 이미지 출력을 위한 파일코드 검색
		Integer selfilecode = dao.selfilecode(nbno);
		System.out.println("selfilecode :" + selfilecode);

		// 파일코드로 이미지 조회 후 모델에 담아 뷰에 전송
		if (selfilecode!=null) {
			ArrayList<NoticeImgDto> imglist = dao.imglist(selfilecode);
			System.out.println("imglist : " + imglist);
			model.addAttribute("imglist", imglist);			
		}

	}
}
