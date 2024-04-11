package com.tech.ibara.csnotice.service.notice;

import java.io.File;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.csnotice.dao.NoticeBoardIDao;

public class CsNoticeDeleteService implements CsNoticeService {

	private SqlSession sqlSession;

	public CsNoticeDeleteService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}

	@Override
	public void execute(Model model) {

		Map<String, Object> map=model.asMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		NoticeBoardIDao dao = sqlSession.getMapper(NoticeBoardIDao.class);

		String nbno = request.getParameter("nbno");
		System.out.println("delete : " + nbno);

		
		// 글 번호 이용해서 파일코드 조회
		Integer selfilecode = dao.selfilecode(nbno);
		// 파일코드 출력
		System.out.println("filecode : " + selfilecode);
		
		if (selfilecode!=0) {
		
		ArrayList<String> fileListbefore = dao.getfileListbefore(selfilecode);
		System.out.println("fileListbefore :"+fileListbefore);
		
		String path = "C:\\interiorbara01\\interiorbara01\\src\\main\\webapp\\resources\\upload\\cs";

		// 이전 파일 삭제
		for (String f : fileListbefore) {
			File file = new File(path + "\\" + f);
			System.out.println(path + "\\" + f);
			if (file.exists()) {
				file.delete();
				System.out.println("이미지 삭제완료: " + f);
			} else {
				System.out.println("이미지 삭제실패: " + f);
			}
		}
		}
		
		// 파일코드로 이미지 삭제
		dao.imgdelete(selfilecode);
		// 글 앞에서 받은 글 번호로 게시글 삭제
		dao.noticedelete(nbno);

	}
}
