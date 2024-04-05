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

public class CsQnaDeleteService implements CsQnaService {

	private SqlSession sqlSession;

	public CsQnaDeleteService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}

	@Override
	public void execute(Model model) {

		Map<String, Object> map=model.asMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		
		QnaBoardIDao dao = sqlSession.getMapper(QnaBoardIDao.class);

		String qbno = request.getParameter("qbno");
		System.out.println("delete : " + qbno);

		
		// 글 번호 이용해서 파일코드 조회
		Integer selfilecode = dao.selfilecode(qbno);
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
		dao.qnadelete(qbno);

	}
}
