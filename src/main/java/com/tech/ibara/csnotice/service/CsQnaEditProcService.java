package com.tech.ibara.csnotice.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tech.ibara.csnotice.dao.QnaBoardIDao;

public class CsQnaEditProcService implements CsQnaService {

	CsQnaService csQnaService;
	
	private SqlSession sqlSession;
	
	public CsQnaEditProcService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	
	@Override
	public void execute(Model model) {
		
		Map<String, Object> map =model.asMap();
		MultipartHttpServletRequest mftrequest=(MultipartHttpServletRequest) map.get("mftrequest");
		
		String qbtitle = mftrequest.getParameter("qbtitle");
		String qbcontent = mftrequest.getParameter("qbcontent");
		String qnadiv = mftrequest.getParameter("qnadiv");
		String qbno = mftrequest.getParameter("qbno");

		System.out.println("qbtitle : " + qbtitle);
		System.out.println("qbcontent : " + qbcontent);
		System.out.println("qnadiv : " + qnadiv);
		System.out.println("qbno : " + qbno);

		QnaBoardIDao dao = sqlSession.getMapper(QnaBoardIDao.class);

		dao.qnaeditproc(qbno, qbtitle, qbcontent, qnadiv);

		String path = "C:\\interiorbara01\\interiorbara01\\src\\main\\webapp\\resources\\upload\\cs";

		List<MultipartFile> fileList = mftrequest.getFiles("qbfile");
		System.out.println("fileList : " + fileList);

		// 수정 파일을 올린 경우에만 실행
		if (fileList != null) {
			// 이전 파일 조회
			Integer selfilecode = dao.selfilecode(qbno);
			System.out.println("selfilecode :" + selfilecode);

			ArrayList<String> fileListbefore = dao.getfileListbefore(selfilecode);
			System.out.println("fileListbefore :"+fileListbefore);

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
			// DB 삭제
			dao.deletefilebefore(selfilecode);
		}

		// 파일 이름 업로드 당시 밀리초로 변경
		for (MultipartFile mf : fileList) {
			String originFile = mf.getOriginalFilename();
			System.out.println("파일이름 : " + originFile);
			long longtime = System.currentTimeMillis();
			String changeFile = longtime + "_" + mf.getOriginalFilename();
			System.out.println("변형된 파일 이름 : " + changeFile);
			String pathFile = path + "\\" + changeFile;

			// 파일코드 조회
			Integer filecode = dao.selfilecode(qbno);
			System.out.println("filecode: " + filecode);

			// 이미지 업로드
			try {
				if (!originFile.equals("")) {
					mf.transferTo(new File(pathFile));
					System.out.println("다중 업로드 성공");
//					db에 파일 이름 인서트
					dao.editimg(filecode, changeFile);
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		
	}
}
