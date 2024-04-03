package com.tech.ibara.csnotice;

import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tech.ibara.csnotice.dao.QnaBoardIDao;
import com.tech.ibara.csnotice.dto.QnaDto;
import com.tech.ibara.csnotice.dto.QnaImgDto;
import com.tech.ibara.csnotice.dto.QnaReplyDto;
import com.tech.ibara.csnotice.service.CsQnaListService;
import com.tech.ibara.csnotice.service.CsQnaService;
import com.tech.ibara.csnotice.vo.SearchVO;

@Controller
public class CsQnaController {

	@Autowired
	private SqlSession sqlSession;
	
	CsQnaService csQnaService;
	
	
	// 리스트 컨트롤러
	@RequestMapping("/qnalist")
	public String qnalist(HttpServletRequest request, SearchVO searchVO, Model model) {
		System.out.println("qnaList()controller");

		model.addAttribute("request",request);
		model.addAttribute("searchVo",searchVO);
		
		csQnaService = new CsQnaListService(sqlSession);
		csQnaService.execute(model);
		
		return "csnotice/qnalist";
	}//리스트 컨트롤러

	
	// 별 기능 없음 writeview로 이동
	@RequestMapping("/qnawriteview")
	public String qnawriteview() {

		return "csnotice/qnawriteview";
	}

	
	// 글 게시 컨트롤러
	@RequestMapping("/qnawrite")
	public String qnawrite(MultipartHttpServletRequest mftrequest, Model model) {

		System.out.println("qnawrite()controller");

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

		QnaBoardIDao dao = sqlSession.getMapper(QnaBoardIDao.class);

		// 최근의 글번호
		Integer snbno = dao.selsnbno();
		System.out.println("snbno: " + snbno);

		// snbno null 처리
		if (snbno == null) {
			snbno = 1;
		}

		// 글 작성
		dao.qnawrite(nbwriter, nbtitle, nbcontent, snbno, qnadiv);

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
		return "redirect:qnalist";
	}

	@RequestMapping("/qnacontent")
	public String qnacontent(HttpServletRequest request, Model model) {
		System.out.println("qnacontent()controller");

		QnaBoardIDao dao = sqlSession.getMapper(QnaBoardIDao.class);

		String nbno = request.getParameter("nbno");
		String rnbno = request.getParameter("rnbno");
		System.out.println(nbno);
		System.out.println(rnbno);

		// 글 번호로 조회수 올리기
		dao.uphit(nbno);

		// 콘탠트 조회 후 dto에 담기
		QnaDto dto = dao.qnacontent(nbno);
		// model에 담아서 뷰단에 보내줌
		model.addAttribute("qna_content", dto);

		// 답글 셀렉트 해서 출력
		ArrayList<QnaReplyDto> replylist = dao.replylist(nbno);
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
		ArrayList<QnaImgDto> imglist = dao.imglist(selfilecode);
		System.out.println("imglist : " + imglist);
		model.addAttribute("imglist", imglist);

		return "csnotice/qnacontent";
	}

	@RequestMapping("/qnaeditview")
	public String qnacontentedit(HttpServletRequest request, Model model) {

		String nbno = request.getParameter("nbno");
		System.out.println("nbno: " + nbno);

		QnaBoardIDao dao = sqlSession.getMapper(QnaBoardIDao.class);

		QnaDto qna = dao.qnacontent(nbno);

		ArrayList<QnaImgDto> qnaimg = dao.qnacontentimgview(nbno);

		model.addAttribute("qna_content", qna);
		model.addAttribute("qnaimg", qnaimg);

		System.out.println("nbno: " + nbno);

		return "csnotice/qnaeditview";
	}

	// 글 수정
	@RequestMapping("/qnaeditproc")
	public String qnaeditproc(MultipartHttpServletRequest mftrequest, Model model) {

		System.out.println("qnaeditproc()controller");

		String nbtitle = mftrequest.getParameter("nbtitle");
		String nbcontent = mftrequest.getParameter("nbcontent");
		String qnadiv = mftrequest.getParameter("qnadiv");
		String nbno = mftrequest.getParameter("nbno");

		System.out.println("nbtitle : " + nbtitle);
		System.out.println("nbcontent : " + nbcontent);
		System.out.println("qnadiv : " + qnadiv);
		System.out.println("nbno : " + nbno);

		QnaBoardIDao dao = sqlSession.getMapper(QnaBoardIDao.class);

		dao.qnaeditproc(nbno, nbtitle, nbcontent, qnadiv);

		String path = "C:\\interiorbara01\\interiorbara01\\src\\main\\webapp\\resources\\upload\\cs";

		List<MultipartFile> fileList = mftrequest.getFiles("nbfile");
		System.out.println("fileList : " + fileList);

		// 수정 파일을 올린 경우에만 실행
		if (fileList != null) {
			// 이전 파일 조회
			Integer selfilecode = dao.selfilecode(nbno);
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
			Integer filecode = dao.selfilecode(nbno);
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

		return "redirect:qnacontent?nbno=" + nbno;
	}

	@RequestMapping("/qnadelete")
	public String qnadelete(HttpServletRequest request, Model model) {
		System.out.println("qnadelete()controller");

		QnaBoardIDao dao = sqlSession.getMapper(QnaBoardIDao.class);

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
		dao.qnadelete(nbno);

		return "redirect:qnalist";
	}

	@RequestMapping(method = RequestMethod.POST, value = "/qnareply")
	public String qnareply(HttpServletRequest request, Model model) {
		System.out.println("qnareply()");

		QnaBoardIDao dao = sqlSession.getMapper(QnaBoardIDao.class);

		String nbno = request.getParameter("nbno");
		String qnareply = request.getParameter("qnareply");
		String qnarewriter = request.getParameter("qnarewriter");

		// 전체 답글 달기
		dao.qnareply(nbno, qnareply, qnarewriter);

		return "redirect:qnacontent?nbno=" + nbno;
	}

	@RequestMapping(method = RequestMethod.POST, value = "/qnareply_r")
	public String qnareply_r(HttpServletRequest request, Model model) throws ClassNotFoundException, SQLException {
		System.out.println("qnareply()");

		QnaBoardIDao dao = sqlSession.getMapper(QnaBoardIDao.class);

		String nbno = request.getParameter("nbno");
		String rnbno = request.getParameter("rnbno");
		String rwriter = request.getParameter("rwriter");
		String rcontent = request.getParameter("rcontent");
		String rnbstep = request.getParameter("rnbstep");
		String rnbgroup = request.getParameter("rnbgroup");
		String rnbindent = request.getParameter("rnbindent");

		System.out.println("nbno :" + nbno);
		System.out.println("rnbno :" + rnbno);
		System.out.println("rwriter :" + rwriter);
		System.out.println("rcontent :" + rcontent);
		System.out.println("rnbstep :" + rnbstep);
		System.out.println("rnbindent :" + rnbindent);

		String sql = "select * from dept";
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "hr";
		String pw = "123456";
		Connection conn = DriverManager.getConnection(url, user, pw);
		Statement stmt = conn.createStatement();

		return "redirect:qnacontent?nbno=" + nbno;
	}

}
