package com.tech.ibara.csnotice.service;

import java.util.ArrayList;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import com.tech.ibara.csnotice.dao.QnaBoardIDao;
import com.tech.ibara.csnotice.dto.QnaDto;
import com.tech.ibara.csnotice.vo.SearchVO;

public class CsQnaListService implements CsQnaService {

	private SqlSession sqlSession;

	public CsQnaListService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}

	@Override
	public void execute(Model model) {

		Map<String, Object> map=model.asMap();
		HttpServletRequest request=(HttpServletRequest) map.get("request");
		SearchVO searchVO=(SearchVO) map.get("searchVO");
		
		// dao 선언
		QnaBoardIDao dao = sqlSession.getMapper(QnaBoardIDao.class);

//				서칭 처리
		String qq = "";
		String all = "";
		String oh = "";
		String biz = "";
		String pf = "";
		String sh = "";

		// 글 분류 확인
		String qnadiv = request.getParameter("qnadiv");

		// 처음 리스트 들어왔을 떄 셀렉트 박스 널값 체크 해결 if 문
		if (qnadiv == null) {
			qnadiv = "all";
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

//				페이징
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

//				total count 찍히게
		System.out.println("total : " + total);

		// 토탈 값을 보내서 페이지 수 검색
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

	}
}
