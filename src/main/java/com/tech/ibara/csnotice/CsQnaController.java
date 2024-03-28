package com.tech.ibara.csnotice;

import java.io.File;
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
import com.tech.ibara.csnotice.vo.SearchVO;

@Controller
public class CsQnaController {

	@Autowired
	private SqlSession sqlSession;

	// 리스트 컨트롤러
	@RequestMapping("/qnalist")
	public String qnalist(HttpServletRequest request, SearchVO searchVO, Model model) {
		System.out.println("qnaList()controller");

		//dao 선언
		QnaBoardIDao dao = sqlSession.getMapper(QnaBoardIDao.class);

//		서칭 처리
		String qq = "";
		String all = "";
		String oh = "";
		String biz = "";
		String pf = "";
		String sh = "";

		//글 분류 확인
		String qnadiv = request.getParameter("qnadiv");

		//처음 리스트 들어왔을 떄 셀렉트 박스 널값 체크 해결 if 문
		if (qnadiv==null) {   
			qnadiv="all";
		}
		System.out.println("qnadiv : " + qnadiv);
		
		// 위 변수의 체크상태 저장
		if (qnadiv != null) { 
			if (qnadiv.equals("qq")) {
				qq = "qq";
				model.addAttribute("qq", "true");
				
			} else if (qnadiv.equals("all")) {
				all = "all";
				model.addAttribute("all", "true");
				
			} else if (qnadiv.equals("oh")) {
				oh = "oh";
				model.addAttribute("oh", "true");
				
			} else if (qnadiv.equals("biz")) {
				biz = "biz";
				model.addAttribute("biz", "true");
				
			} else if (qnadiv.equals("pf")) {
				pf = "pf";
				model.addAttribute("pf", "true");
				
			} else if (qnadiv.equals("sh")) {
				sh = "sh";
				model.addAttribute("sh", "true");
			}
		}

		// 검색 결과 유지
		String a = request.getParameter("all");
		String q = request.getParameter("qq");
		String o = request.getParameter("oh");
		String b = request.getParameter("biz");
		String p = request.getParameter("pf");
		String s = request.getParameter("sh");

		
		if (a != null) {
			if (a.equals("all")) {
				all = a;
				model.addAttribute("all", "true");
			}
		}
		if (q != null) {
			if (q.equals("qq")) {
				qq = q;
				model.addAttribute("qq", "true");
			}
		}
		if (o != null) {
			if (o.equals("oh")) {
				oh = o;
				model.addAttribute("oh", "true");
			}
		}
		if (b != null) {
			if (b.equals("biz")) {
				biz = b;
				model.addAttribute("biz", "true");
			}
		}
		if (p != null) {
			if (p.equals("pf")) {
				pf = p;
				model.addAttribute("pf", "true");
			}
		}
		if (s != null) {
			if (s.equals("sh")) {
				sh = s;
				model.addAttribute("sh", "true");
			}
		}

		// sk값 가져오기(검색 키워드)
		String searchKeyword = request.getParameter("sk");
		
		// 검색문자 null처리
		if (searchKeyword == null) { 
			searchKeyword = "";
		}
		model.addAttribute("searchKeyword", searchKeyword);
		
		// searchKeyword 확인하는 출력문
		System.out.println("searchKeyword : " + searchKeyword); 

//		페이징
		String strPage = request.getParameter("page");
		// 처음 들어왔을 떄 페이지 null처리
		if (strPage == null) {
			strPage = "1";
		}

		int page = Integer.parseInt(strPage);
		searchVO.setPage(page);
		// 토탈 글 갯수
		// 검색에 적용

		int total = 0;
		if (qq.equals("qq")) { // 퀵견적 검색
			total = dao.selectBoardTotalCount1();
			System.out.println("totqq");
		} else if (all.equals("all")) { // 전체 검색
			total = dao.selectBoardTotalCount2();
			System.out.println("totall");
		} else if (oh.equals("oh")) { // 우리집 자랑 검색
			total = dao.selectBoardTotalCount3();
			
		} else if (biz.equals("biz")) { // 업체 검색
			total = dao.selectBoardTotalCount4();
			
		} else if (pf.equals("pf")) { // 회원정보 검색
			total = dao.selectBoardTotalCount5();
			
		} else if (sh.equals("sh")) { // 소품샵 검색
			total = dao.selectBoardTotalCount6();
		}
		
//		total count 찍히게
		System.out.println("total : " + total);

		//토탈 값을 보내서 페이지 수 검색 
		searchVO.pageCalculate(total);

		// 계산된 값
		System.out.println("total" + total);
		System.out.println("clickpage" + strPage);
		System.out.println("pagestart" + searchVO.getPageStart());
		System.out.println("pageend" + searchVO.getPageEnd());
		System.out.println("rowstart" + searchVO.getRowStart());
		System.out.println("rowend" + searchVO.getRowEnd());

		
		int rowStart = searchVO.getRowStart();
		int rowEnd = searchVO.getRowEnd();

		ArrayList<QnaDto> list = null;
		
		if (qq.equals("qq")) { // 퀵견적 검색
			model.addAttribute("list", dao.qnalist(rowStart, rowEnd, searchKeyword, "1"));
			
		} else if (all.equals("all")) { // 전체 검색
			model.addAttribute("list", dao.qnalist(rowStart, rowEnd, searchKeyword, "2"));
			
		} else if (oh.equals("oh")) { // 우리집 자랑 검색
			model.addAttribute("list", dao.qnalist(rowStart, rowEnd, searchKeyword, "3"));
			
		} else if (biz.equals("biz")) { // 비즈 검색
			model.addAttribute("list", dao.qnalist(rowStart, rowEnd, searchKeyword, "4"));
			
		} else if (pf.equals("pf")) { // 회원정보 검색
			model.addAttribute("list", dao.qnalist(rowStart, rowEnd, searchKeyword, "5"));
			
		} else if (sh.equals("sh")) { // 소품샵 검색
			model.addAttribute("list", dao.qnalist(rowStart, rowEnd, searchKeyword, "6"));
		}
		
		System.out.println("=======================");
		
		model.addAttribute("totalRowcnt", total);
		model.addAttribute("searchVo", searchVO);

		return "csnotice/qnalist";
	}
	
	
	//별 기능 없음 writeview로 이동
	@RequestMapping("/qnawriteview")
	public String qnawriteview() {

		return "csnotice/qnawriteview";
	}

	//글 게시
	@RequestMapping("/qnawrite")
	public String qnawrite(MultipartHttpServletRequest mftrequest, Model model) {

		System.out.println("qnawrite()controller");

		String nbwriter = mftrequest.getParameter("nbwriter");
		String nbtitle = mftrequest.getParameter("nbtitle");
		String nbcontent = mftrequest.getParameter("nbcontent");
		String qnadiv = mftrequest.getParameter("qnadiv");

		String path = "C:\\23setspring\\springwork23\\interiorbara2\\src\\main\\webapp\\resources\\img";
//		MultipartRequest req=new MultipartRequest(mftrequest, path,1024*1024*10,"utf-8",new DefaultFileRenamePolicy());

		System.out.println("nbwriter : " + nbwriter);
		System.out.println("nbtitle : " + nbtitle);
		System.out.println("nbcontent : " + nbcontent);
		System.out.println("qnadiv : " + qnadiv);

		List<MultipartFile> fileList = mftrequest.getFiles("nbfile");

		System.out.println("fileList : " + fileList);

		QnaBoardIDao dao = sqlSession.getMapper(QnaBoardIDao.class);

		// 최근의 글번호
		int snbno = dao.selsnbno();
		System.out.println("snbno: " + snbno);

		//파일 이름 업로드 당시 밀리초로 변경
		for (MultipartFile mf : fileList) {
			String originFile = mf.getOriginalFilename();
			System.out.println("파일이름 : " + originFile);
			long longtime = System.currentTimeMillis();
			String changeFile = longtime + "_" + mf.getOriginalFilename();
			System.out.println("변형된 파일 이름 : " + changeFile);
			String pathFile = path + "\\" + changeFile;
			
			
			//이미지 없이 글 올릴 경우 filecode 0으로 설정
			if (originFile=="") {
				snbno=(-1);
				System.out.println("snbno=-1"); 
			}

			//글 작성 
			dao.qnawrite(nbwriter, nbtitle, nbcontent, snbno, qnadiv);
			
			//이미지 업로드
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
		System.out.println(nbno);
		
		//글 번호로 조회수 올리기
		dao.uphit(nbno);
		
		//콘탠트 조회 후 dto에 담기
		QnaDto dto = dao.qnacontent(nbno);
		// model에 담아서 뷰단에 보내줌
		model.addAttribute("qna_content", dto);
		
		//답글 셀렉트 해서 출력
		ArrayList<QnaReplyDto> replylist=dao.replylist(nbno);
		System.out.println("replylist : "+replylist);
		
		model.addAttribute("replylist",replylist);

		return "csnotice/qnacontent";
	}
	
	@RequestMapping("/qnaeditview")
	public String qnacontentedit(HttpServletRequest request, Model model) {
		
		String nbno=request.getParameter("nbno");
		
		QnaBoardIDao dao = sqlSession.getMapper(QnaBoardIDao.class);
		
		QnaDto qna = dao.qnacontentview(nbno);
		
		ArrayList<QnaImgDto> qnaimg =dao.qnacontentimgview(nbno);
		
		model.addAttribute("qna_content",qna);
		model.addAttribute("qnaimg",qnaimg);
		
		return "csnotice/qnaeditview";
	}
	
	
	@RequestMapping("/qnadelete")
	public String qnadelete(HttpServletRequest request, Model model) {
		System.out.println("qnadelete()controller");
		
		
		QnaBoardIDao dao = sqlSession.getMapper(QnaBoardIDao.class);
		
		String nbno=request.getParameter("nbno");
		System.out.println("delete : "+nbno);
		
		// 글 번호 이용해서 파일코드 조회
		int filecode=dao.selfilecode(nbno);
		// 파일코드 출력
		System.out.println("filecode : "+filecode);
		
		//파일코드로 이미지 먼저 삭제
		dao.imgdelete(filecode);
		//글 앞에서 받은 글 번호로 게시글 삭제
		dao.qnadelete(nbno);
		
		return "redirect:qnalist";
	}
	
	@RequestMapping(method = RequestMethod.POST,value = "/qnareply")
	public String qnareply(HttpServletRequest request,Model model) {
		System.out.println("qnareply()");
		
		QnaBoardIDao dao=sqlSession.getMapper(QnaBoardIDao.class);

		String nbno=request.getParameter("nbno");
		String qnareply=request.getParameter("qnareply");		
		String qnarewriter=request.getParameter("qnarewriter");		

		// 전체 답글 달기
		dao.qnareply(nbno,qnareply,qnarewriter);

		
		return "redirect:qnacontent?nbno="+nbno;
	}

}
