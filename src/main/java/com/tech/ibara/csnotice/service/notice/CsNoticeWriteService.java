package com.tech.ibara.csnotice.service.notice;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tech.ibara.csnotice.dao.NoticeBoardIDao;
import com.tech.ibara.csnotice.dao.QnaBoardIDao;

public class CsNoticeWriteService implements CsNoticeService {

	CsNoticeService csNoticeService;
	
	private SqlSession sqlSession;
	
	public CsNoticeWriteService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	
	@Override
	public void execute(Model model) {
		
		Map<String, Object> map =model.asMap();
		MultipartHttpServletRequest mftrequest=(MultipartHttpServletRequest) map.get("mftrequest");
		
		String nbwriter = mftrequest.getParameter("nbwriter");
		String nbtitle = mftrequest.getParameter("nbtitle");
		String nbcontent = mftrequest.getParameter("nbcontent");
		String qnadiv = mftrequest.getParameter("qnadiv");

		String path = "C:\\interiorbara01\\interiorbara01\\src\\main\\webapp\\resources\\upload\\cs";
//		MultipartRequest req=new MultipartRequest(mftrequest, path,1024*1024*10,"utf-8",new DefaultFileRenamePolicy());

		System.out.println("nbwriter : " + nbwriter);
		System.out.println("nbtitle : " + nbtitle);
		System.out.println("nbcontent : " + nbcontent);
		System.out.println("qnadiv : " + qnadiv);

		List<MultipartFile> fileList = mftrequest.getFiles("nbfile");

		System.out.println("fileList : " + fileList);

		NoticeBoardIDao dao = sqlSession.getMapper(NoticeBoardIDao.class);

		// 최근의 글번호
		Integer snbno = dao.selsnbno();
		System.out.println("snbno: " + snbno);

		// sqbno null 처리
		if (snbno == null) {
			snbno = 1;
		}

		// 글 작성
		dao.noticewrite(nbwriter, nbtitle, nbcontent, snbno, qnadiv);

		// 파일 이름 업로드 당시 밀리초로 변경
		for (MultipartFile mf : fileList) {
			String originFile = mf.getOriginalFilename();
			System.out.println("파일이름 : " + originFile);
			long longtime = System.currentTimeMillis();
			String changeFile = longtime + "_" + mf.getOriginalFilename();
			System.out.println("변형된 파일 이름 : " + changeFile);
			String pathFile = path + "\\" + changeFile;

			// 이미지 없이 글 올릴 경우 filecode 0으로 설정
			if (originFile == "") {
				snbno = (-1);
				System.out.println("snbno=-1");
			}
			// 이미지 업로드
			try {
				if (!originFile.equals("")) {
					mf.transferTo(new File(pathFile));
					System.out.println("다중 업로드 성공");
//					db에 파일 이름 인서트
					dao.imgwrite(snbno, changeFile);

				}
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		
	}

}
