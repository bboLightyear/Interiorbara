package com.tech.ibara.biz.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tech.ibara.biz.service.BizServiceInter;
import com.tech.ibara.biz.service.cases.BizCasesContentViewService;
import com.tech.ibara.biz.service.cases.BizCasesDelService;
import com.tech.ibara.biz.service.cases.BizCasesDelViewService;
import com.tech.ibara.biz.service.cases.BizCasesListService;
import com.tech.ibara.biz.service.cases.BizCasesListUnderService;
import com.tech.ibara.biz.service.cases.BizCasesModService;
import com.tech.ibara.biz.service.cases.BizCasesModViewService;
import com.tech.ibara.biz.service.cases.BizCasesWriteService;
import com.tech.ibara.biz.service.home.BizHomeBmarkService;
import com.tech.ibara.biz.service.home.BizHomeInfoModService;
import com.tech.ibara.biz.service.home.BizHomeInfoModViewService;
import com.tech.ibara.biz.service.home.BizHomeInfoViewService;
import com.tech.ibara.biz.service.home.BizHomeMapService;
import com.tech.ibara.biz.service.home.BizHomeService;
import com.tech.ibara.biz.service.home.BizHomeUnderService;
import com.tech.ibara.biz.service.magazine.BizMgzContentViewService;
import com.tech.ibara.biz.service.magazine.BizMgzDelService;
import com.tech.ibara.biz.service.magazine.BizMgzDelViewService;
import com.tech.ibara.biz.service.magazine.BizMgzListService;
import com.tech.ibara.biz.service.magazine.BizMgzModService;
import com.tech.ibara.biz.service.magazine.BizMgzModViewService;
import com.tech.ibara.biz.service.magazine.BizMgzWriteService;
import com.tech.ibara.biz.service.review.BizRvContentViewService;
import com.tech.ibara.biz.service.review.BizRvDelService;
import com.tech.ibara.biz.service.review.BizRvImgPopUpViewService;
import com.tech.ibara.biz.service.review.BizRvLikeService;
import com.tech.ibara.biz.service.review.BizRvListService;
import com.tech.ibara.biz.service.review.BizRvListUnderService;
import com.tech.ibara.biz.service.review.BizRvModDelViewService;
import com.tech.ibara.biz.service.review.BizRvModService;
import com.tech.ibara.biz.service.review.BizRvReportResultViewService;
import com.tech.ibara.biz.service.review.BizRvReportService;
import com.tech.ibara.biz.service.review.BizRvReportViewService;
import com.tech.ibara.biz.service.review.BizRvWriteService;
import com.tech.ibara.biz.service.search.BizAddrSearchBasicService;
import com.tech.ibara.biz.service.search.BizAddrSearchContCntService;
import com.tech.ibara.biz.service.search.BizAddrSearchMoreService;
import com.tech.ibara.biz.service.search.BizAddrSearchRvCntService;
import com.tech.ibara.biz.service.search.BizAddrSearchService;
import com.tech.ibara.biz.service.search.BizAddrSearchStarService;
import com.tech.ibara.biz.service.search.BizProSearchBasicService;
import com.tech.ibara.biz.service.search.BizProSearchContCntService;
import com.tech.ibara.biz.service.search.BizProSearchRvCntService;
import com.tech.ibara.biz.service.search.BizProSearchService;
import com.tech.ibara.biz.service.search.BizProSearchStarService;
import com.tech.ibara.biz.vo.BizInfiniteSearchVO;
import com.tech.ibara.biz.vo.BizSearchVO;

@Controller
public class BizController {

	private BizServiceInter bizServiceInter;

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private HttpSession session;

	
	
//	지도로 검색
	
	
	@RequestMapping("/biz/search/bizAddrSearch") 
	public String bizAddrSearch(HttpServletRequest request, BizInfiniteSearchVO searchVO, Model model) {
		System.out.println("controller bizAddrSearch();");		
		
		model.addAttribute("request",request);
		model.addAttribute("searchVO", searchVO);
		
		bizServiceInter=new BizAddrSearchService(sqlSession);
		bizServiceInter.execute(model);
		
		return "/biz/search/bizAddrSearch";
	}
	
	 @PostMapping("/biz/search/bizAddrSearchMore")
	    public String bizAddrSearchMore(@RequestParam("sk") String sk,
	    								@RequestParam("page") String page, BizInfiniteSearchVO searchVO,
	    								Model model) {
		 
		 System.out.println("controller bizAddrSearchMore();");	
			
		 

			model.addAttribute("sk",sk);
			model.addAttribute("page",page);
			model.addAttribute("searchVO", searchVO);
			
			bizServiceInter=new BizAddrSearchMoreService(sqlSession);
			bizServiceInter.execute(model);
			
			return "/biz/search/bizAddrSearchMore";
		 
	    }	
	
	
	
	
	 @PostMapping("/biz/search/bizAddrSearchBasic")
	    public String bizAddrSearchBasic(@RequestParam("addrToSearch") String addrToSearch, Model model) {
		 
		 System.out.println("controller bizAddrSearchBasic();");	
			
		 
		 	System.out.println("addrToSearch: "+addrToSearch);
			model.addAttribute("addrToSearch",addrToSearch);
			
			
			bizServiceInter=new BizAddrSearchBasicService(sqlSession);
			bizServiceInter.execute(model);
			
			return "/biz/search/bizAddrSearchBasic";
		 
	    }
	 
	 
	 @PostMapping("/biz/search/bizAddrSearchStar")
	    public String bizAddrSearchStar(@RequestParam("addrToSearch") String addrToSearch, Model model) {
		 
		 System.out.println("controller bizAddrSearchStar();");	
			
		 
		 	System.out.println("addrToSearch: "+addrToSearch);
			model.addAttribute("addrToSearch",addrToSearch);
			
			
			bizServiceInter=new BizAddrSearchStarService(sqlSession);
			bizServiceInter.execute(model);
			
			return "/biz/search/bizAddrSearchStar";
		 
	    }
	 
	 @PostMapping("/biz/search/bizAddrSearchRvCnt")
	    public String bizAddrSearchRvCnt(@RequestParam("addrToSearch") String addrToSearch, Model model) {
		 
		 System.out.println("controller bizAddrSearchRvCnt();");	
			
		 
		 	System.out.println("addrToSearch: "+addrToSearch);
			model.addAttribute("addrToSearch",addrToSearch);
			
			
			bizServiceInter=new BizAddrSearchRvCntService(sqlSession);
			bizServiceInter.execute(model);
			
			return "/biz/search/bizAddrSearchRvCnt";
		 
	    }
	 
	 @PostMapping("biz/search/bizAddrSearchContCnt")
	 public String bizAddrSearchContCnt(@RequestParam("addrToSearch") String addrToSearch, Model model) {
		 
		 System.out.println("controller bizAddrSearchContCnt();");	
		 
		 
		 System.out.println("addrToSearch: "+addrToSearch);
		 model.addAttribute("addrToSearch",addrToSearch);
		 
		 
		 bizServiceInter=new BizAddrSearchContCntService(sqlSession);
		 bizServiceInter.execute(model);
		 
		 return "/biz/search/bizAddrSearchContCnt";
		 
	 }
		
		
		
		
		
		
		
		
		
		
		
//		전문시공영역으로 검색
		
		
		@RequestMapping("/biz/search/bizProSearch") 
		public String bizProSearch(HttpServletRequest request, BizInfiniteSearchVO searchVO, Model model) {
			System.out.println("controller bizProSearch();");		
			
			model.addAttribute("request",request);
			model.addAttribute("searchVO", searchVO);
			
			bizServiceInter=new BizProSearchService(sqlSession);
			bizServiceInter.execute(model);
			
			return "/biz/search/bizProSearch";
		}
		
		@RequestMapping("/biz/search/bizProSearchBasic") 
		public String bizProSearchBasic(HttpServletRequest request, BizInfiniteSearchVO searchVO, Model model) {
			System.out.println("controller bizProSearchBasic();");		
			
			model.addAttribute("request",request);
			model.addAttribute("searchVO", searchVO);
			
			bizServiceInter=new BizProSearchBasicService(sqlSession);
			bizServiceInter.execute(model);
			
			return "/biz/search/bizProSearchBasic";
		}
		
		@RequestMapping("/biz/search/bizProSearchStar") 
		public String bizProSearchStar(HttpServletRequest request, BizInfiniteSearchVO searchVO, Model model) {
			System.out.println("controller bizProSearchStar();");		
			
			model.addAttribute("request",request);
			model.addAttribute("searchVO", searchVO);
			
			bizServiceInter=new BizProSearchStarService(sqlSession);
			bizServiceInter.execute(model);
			
			return "/biz/search/bizProSearchStar";
		}
		
		@RequestMapping("/biz/search/bizProSearchRvCnt") 
		public String bizProSearchRvCnt(HttpServletRequest request, BizInfiniteSearchVO searchVO, Model model) {
			System.out.println("controller bizProSearchRvCnt();");		
			
			model.addAttribute("request",request);
			model.addAttribute("searchVO", searchVO);
			
			bizServiceInter=new BizProSearchRvCntService(sqlSession);
			bizServiceInter.execute(model);
			
			return "/biz/search/bizProSearchRvCnt";
		}
		 
		@RequestMapping("/biz/search/bizProSearchContCnt") 
		public String bizProSearchContCnt(HttpServletRequest request, BizInfiniteSearchVO searchVO, Model model) {
			System.out.println("controller bizProSearchContCnt();");		
			
			model.addAttribute("request",request);
			model.addAttribute("searchVO", searchVO);
			
			bizServiceInter=new BizProSearchContCntService(sqlSession);
			bizServiceInter.execute(model);
			
			return "/biz/search/bizProSearchContCnt";
		}
		
		
		
		
		
	
	
	
	
	
	
	// 업체 홈
	
	
	@RequestMapping(value = "/biz/home/bizHome", method = RequestMethod.GET) 
	public String bizHome(HttpServletRequest request,Model model) {
		System.out.println("controller bizHome();");		
		
		model.addAttribute("request",request);
		
		bizServiceInter=new BizHomeService(sqlSession, session);
		bizServiceInter.execute(model);
		
		return "/biz/home/bizHome";
	}
	
	@RequestMapping(value = "/biz/home/bizHomeUnder")
	 public String bizHomeUnder(@RequestParam("inteno") String inteno, Model model) {
		System.out.println("controller bizHomeUnder();");		
		
		 model.addAttribute("inteno",inteno);
		
		bizServiceInter=new BizHomeUnderService(sqlSession);
		bizServiceInter.execute(model);
		
		return "/biz/home/bizHomeUnder";
	}
	
	
	@RequestMapping("/biz/home/bizHomeBmark") 
	public void bizHomeBmark(HttpServletRequest request, HttpServletResponse response, Model model) throws ServletException, IOException {
		System.out.println("controller bizHomeBmark();");	
		model.addAttribute("request",request);
		
		bizServiceInter=new BizHomeBmarkService(sqlSession);
		bizServiceInter.execute(model);
		
	}
	
	@RequestMapping("/biz/home/bizHomeInfoView") 
	public String bizHomeInfoView(HttpServletRequest request,Model model) {
		System.out.println("controller bizHomeInfoView();");		
		
		model.addAttribute("request",request);
		
		bizServiceInter=new BizHomeInfoViewService(sqlSession);
		bizServiceInter.execute(model);
		
		return "/biz/home/bizHomeInfoView";
	}
	
	
	
	@RequestMapping("/biz/home/bizHomeInfoModView") 
	public String bizHomeInfoModView(HttpServletRequest request,Model model) {
		System.out.println("controller bizHomeInfoModView();");		
		
		model.addAttribute("request",request);
		
		bizServiceInter=new BizHomeInfoModViewService(sqlSession);
		bizServiceInter.execute(model);
		
		return "/biz/home/bizHomeInfoModView";
	}
	
	@RequestMapping("/biz/home/bizHomeInfoMod") 
	public String bizHomeInfoMod(MultipartHttpServletRequest mftRequest, Model model) {
		System.out.println("controller bizHomeInfoMod();");		
		
		model.addAttribute("mftRequest",mftRequest);
		
		bizServiceInter=new BizHomeInfoModService(sqlSession);
		bizServiceInter.execute(model);
		
		return "redirect:bizHome";
	}
	
	@RequestMapping("/biz/home/bizHomeMap") 
	public String bizHomeMap(HttpServletRequest request,Model model) {
		System.out.println("controller bizHomeMap();");		
		
		model.addAttribute("request",request);
		
		bizServiceInter=new BizHomeMapService(sqlSession);
		bizServiceInter.execute(model);
		
		return "/biz/home/bizHomeMap";
	}
	
	
	
	
	
	
	
	
	
	
	
//	리뷰 게시판
	
	@RequestMapping(value = "/biz/review/bizRvList", method = RequestMethod.GET) 
	public String bizRvList(HttpServletRequest request,BizSearchVO searchVO,Model model) {
		System.out.println("controller bizRvList();");	
		
		model.addAttribute("request",request);
		model.addAttribute("searchVO",searchVO);
		
		bizServiceInter=new BizRvListService(sqlSession);
		bizServiceInter.execute(model);
		
		return "/biz/review/bizRvList";
	}
	
	 @PostMapping("/biz/review/bizRvListUnder")
	 public String bizRvListUnder(@RequestParam("inteno") String inteno,
			 @RequestParam("memno") String memno, BizSearchVO searchVO, Model model) {
		 System.out.println("controller bizRvListUnder();");		
		 
		 model.addAttribute("inteno",inteno);
		 model.addAttribute("memno",memno);
		 model.addAttribute("searchVO",searchVO);
		 
		 bizServiceInter=new BizRvListUnderService(sqlSession);
		 bizServiceInter.execute(model);
		 
		 return "/biz/review/bizRvListUnder";
	 }
	
	
	
	@RequestMapping("/biz/review/bizRvWriteView")
	public String bizRvWriteView(HttpServletRequest request,Model model) {
		String inteno=request.getParameter("inteno");
		model.addAttribute("inteno", inteno);
		System.out.println("controller bizRvWriteView();");
		return "/biz/review/bizRvWriteView";
	}

	
	
	@RequestMapping("/biz/review/bizRvWrite")
	public String bizRvWrite(MultipartHttpServletRequest mftRequest, Model model){
		String inteno=mftRequest.getParameter("inteno");
		model.addAttribute("inteno", inteno);
		System.out.println("controller bizRvWrite();");
		model.addAttribute("mftRequest",mftRequest);
		bizServiceInter=new BizRvWriteService(sqlSession);
		bizServiceInter.execute(model);
		
		return "redirect:bizRvList";
	}


	@RequestMapping("/biz/review/bizRvDownload")
	public String bizRvDownload(HttpServletRequest request,HttpServletResponse response, Model model) throws Exception {
		System.out.println("controller bizRvdownload();");
		
		String path=request.getParameter("p");
		String fname=request.getParameter("f");
		String br_no=request.getParameter("br_no");
		
		System.out.println("fname: "+fname);
		System.out.println("p: "+path);
		
		
		//다운로드 처리
		//아랫줄은 사용하지 않으면 파일이 브라우저에서 바로 열려버린다. 바로 열지말고 첨부파일으로 취급하는 명령
		response.setHeader("Content-Disposition", "Attachment;filename="
							+URLEncoder.encode(fname,"utf-8"));
		String attachPath="resources\\upload\\biz\\review\\";
		String realPath=request.getSession().getServletContext().getRealPath(attachPath)+"\\"+fname;
		System.out.println("realPath : "+realPath);
		
//		스트링 연결
		FileInputStream fin=new FileInputStream(realPath);
		ServletOutputStream sout=response.getOutputStream();
		
		byte[] buf=new byte[1024];
		int size=0;
		while ((size=fin.read(buf,0,1024))!=-1) {
			sout.write(buf, 0, size);
		}
		fin.close();
		sout.close();
		
		return "bizRvContentView?br_no="+br_no;
	}
	
	
	
	@RequestMapping("/biz/review/bizRvContentView") 
	public String bizRvContent(HttpServletRequest request,Model model) {
		System.out.println("controller bizRvContentView();");	
		
		model.addAttribute("request",request);

		bizServiceInter=new BizRvContentViewService(sqlSession, session);
		bizServiceInter.execute(model);
		
		return "/biz/review/bizRvContentView";
	}

	
	@RequestMapping("/biz/review/bizRvLike") 
	public void bizRvLike(HttpServletRequest request, HttpServletResponse response, Model model) throws ServletException, IOException {
		System.out.println("controller bizRvLike();");	
		model.addAttribute("request",request);
		
		bizServiceInter=new BizRvLikeService(sqlSession);
		bizServiceInter.execute(model);
		
	}
	
	
	
	@RequestMapping("/biz/review/bizRvModDelView") 
	public String bizRvModDelView(HttpServletRequest request,Model model) {
		System.out.println("controller bizRvModDelView();");	
		
		model.addAttribute("request",request);
		String inteno=request.getParameter("inteno");
		model.addAttribute("inteno", inteno);
		
		bizServiceInter=new BizRvModDelViewService(sqlSession);
		bizServiceInter.execute(model);
		
		return "/biz/review/bizRvModDelView";
	}


	
	@RequestMapping(method = RequestMethod.POST,value = "/biz/review/bizRvMod") 
	public String bizRvMod(HttpServletRequest request,Model model) {
		System.out.println("controller bizRvMod();");	
		
		model.addAttribute("request",request);
		String inteno=request.getParameter("inteno");
		model.addAttribute("inteno", inteno);
		
		bizServiceInter=new BizRvModService(sqlSession);
		bizServiceInter.execute(model);
		
		return "redirect:bizRvList";
	}
	

	
	
	
	@RequestMapping("/biz/review/bizRvDel") 
	public String bizRvDel(HttpServletRequest request,Model model) {
		System.out.println("controller bizRvDel();");	
		
		model.addAttribute("request",request);
		
		String br_no=request.getParameter("br_no");
		String inteno=request.getParameter("inteno");
		model.addAttribute("inteno", inteno);
		
		System.out.println("br_no: "+br_no);
		bizServiceInter=new BizRvDelService(sqlSession);
		bizServiceInter.execute(model);
		
		return "redirect:bizRvList";
	}
	
	
	@RequestMapping("/biz/review/bizRvImgPopUpView") 
	public String bizRvImgPopUpView(HttpServletRequest request,Model model) {
		System.out.println("controller bizRvImgPopUpView();");	
		
		model.addAttribute("request",request);
		
		bizServiceInter=new BizRvImgPopUpViewService(sqlSession);
		bizServiceInter.execute(model);
		
		return "/biz/review/bizRvImgPopUpView";
	}
	
	@RequestMapping("/biz/review/bizRvReportView") 
	public String bizRvReportView(HttpServletRequest request,Model model) {
		System.out.println("controller bizRvReportView();");	
		
		model.addAttribute("request",request);
		
		bizServiceInter=new BizRvReportViewService(sqlSession);
		bizServiceInter.execute(model);
		
		return "/biz/review/bizRvReportView";
	}
	
	@RequestMapping("/biz/review/bizRvReport") 
	public String bizRvReport(HttpServletRequest request,Model model) {
		System.out.println("controller bizRvReport();");	
		
		model.addAttribute("request",request);
		
		bizServiceInter=new BizRvReportService(sqlSession);
		bizServiceInter.execute(model);
		
		return "forward:bizRvReportResultView";
	}
	
	
	@RequestMapping("/biz/review/bizRvReportResultView") 
	public String bizRvReportResultView(HttpServletRequest request,Model model) {
		System.out.println("controller bizRvReportResultView();");	
		
		model.addAttribute("request",request);
		
		bizServiceInter=new BizRvReportResultViewService(sqlSession);
		bizServiceInter.execute(model);
		
		return "/biz/review/bizRvReportResultView";
	}
	
	
	
	
	
	
	
	
	
	
	
//	시공사례 게시판

	@RequestMapping(value = "/biz/cases/bizCasesList", method = RequestMethod.GET) 
	public String bizCasesList(HttpServletRequest request,BizSearchVO searchVO,Model model) {
		System.out.println("controller bizCasesList();");	
		
		model.addAttribute("request",request);
		model.addAttribute("searchVO",searchVO);
		
		bizServiceInter=new BizCasesListService(sqlSession);
		bizServiceInter.execute(model);
		
		return "/biz/cases/bizCasesList";
	}
	

	@RequestMapping(value = "/biz/cases/bizCasesListUnder")
	 public String bizCasesListUnder(@RequestParam("inteno") String inteno, BizSearchVO searchVO, Model model) {
		 System.out.println("controller bizCasesListUnder();");		
		 
		 model.addAttribute("inteno",inteno);
		 model.addAttribute("searchVO",searchVO);
		 
		 bizServiceInter=new BizCasesListUnderService(sqlSession);
		 bizServiceInter.execute(model);
		 
		 return "/biz/cases/bizCasesListUnder";
	 }
	
	
	

	@RequestMapping("/biz/cases/bizCasesWriteView")
	public String bizCasesWriteView(HttpServletRequest request,Model model) {
		
		System.out.println("controller bizCasesWriteView();");
		String inteno=request.getParameter("inteno");
		model.addAttribute("inteno", inteno);
		
		return "/biz/cases/bizCasesWriteView";
	}



	@RequestMapping("/biz/cases/bizCasesWrite")
	public String bizCasesWrite(MultipartHttpServletRequest mftRequest, Model model){
		System.out.println("controller bizCasesWrite();");
		
		String inteno=mftRequest.getParameter("inteno");
		model.addAttribute("inteno", inteno);
		model.addAttribute("mftRequest",mftRequest);
		bizServiceInter=new BizCasesWriteService(sqlSession);
		bizServiceInter.execute(model);
		
		return "redirect:bizCasesList";
	}

	

	@RequestMapping("/biz/cases/bizCasesDownload")
	public String bizCasesDownload(HttpServletRequest request,HttpServletResponse response, Model model) throws Exception {
		System.out.println("controller bizCasesdownload();");
		
		String path=request.getParameter("p");
		String fname=request.getParameter("f");
		String bc_no=request.getParameter("bc_no");
		
		System.out.println("fname: "+fname);
		System.out.println("p: "+path);
		
		
		//다운로드 처리
		//아랫줄은 사용하지 않으면 파일이 브라우저에서 바로 열려버린다. 바로 열지말고 첨부파일으로 취급하는 명령
		response.setHeader("Content-Disposition", "Attachment;filename="
							+URLEncoder.encode(fname,"utf-8"));
		String attachPath="resources\\upload\\biz\\cases\\";
		String realPath=request.getSession().getServletContext().getRealPath(attachPath)+"\\"+fname;
		System.out.println("realPath : "+realPath);
		
//		스트링 연결
		FileInputStream fin=new FileInputStream(realPath);
		ServletOutputStream sout=response.getOutputStream();
		
		byte[] buf=new byte[1024];
		int size=0;
		while ((size=fin.read(buf,0,1024))!=-1) {
			sout.write(buf, 0, size);
		}
		fin.close();
		sout.close();
		
		return "bizCasesContentView?bc_no="+bc_no;
	}
	
	
	
	@RequestMapping("/biz/cases/bizCasesContentView") 
	public String bizCasesContent(HttpServletRequest request,Model model) {
		System.out.println("controller bizCasesContentView();");	
		
		model.addAttribute("request",request);

		bizServiceInter=new BizCasesContentViewService(sqlSession);
		bizServiceInter.execute(model);
		
		return "/biz/cases/bizCasesContentView";
	}

	
	
	@RequestMapping("/biz/cases/bizCasesModView") 
	public String bizCasesModView(HttpServletRequest request,Model model) {
		System.out.println("controller bizCasesModView();");	
		
		model.addAttribute("request",request);
		
		bizServiceInter=new BizCasesModViewService(sqlSession);
		bizServiceInter.execute(model);
		
		return "/biz/cases/bizCasesModView";
	}


	
	@RequestMapping(method = RequestMethod.POST,value = "/biz/cases/bizCasesMod") 
	public String bizCasesMod(HttpServletRequest request,Model model) {
		System.out.println("controller bizCasesMod();");	
		
		model.addAttribute("request",request);
		
		bizServiceInter=new BizCasesModService(sqlSession);
		bizServiceInter.execute(model);
		
		return "redirect:bizCasesList";
	}
	
	
	
	@RequestMapping("/biz/cases/bizCasesDelView") 
	public String bizCasesDelView(HttpServletRequest request,Model model) {
		System.out.println("controller bizCasesDelView();");	
		
		model.addAttribute("request",request);
		
		bizServiceInter=new BizCasesDelViewService(sqlSession);
		bizServiceInter.execute(model);
		
		return "/biz/cases/bizCasesDelView";
	}
	
	
	
	@RequestMapping("/biz/cases/bizCasesDel") 
	public String bizCasesDel(HttpServletRequest request,Model model) {
		System.out.println("controller bizCasesDel();");	
		
		model.addAttribute("request",request);
		
		String bc_no=request.getParameter("bc_no");
		
		System.out.println("bc_no: "+bc_no);
		bizServiceInter=new BizCasesDelService(sqlSession);
		bizServiceInter.execute(model);
		
		return "redirect:bizCasesList";
	}
	
	
	
	
	
	
	
	
	
	
	
//	매거진 게시판
	
	@RequestMapping("/biz/magazine/bizMgzList") 
	public String bizMgzList(HttpServletRequest request,BizSearchVO searchVO,Model model) {
		System.out.println("controller bizMgzList();");	
		
		model.addAttribute("request",request);
		model.addAttribute("searchVO",searchVO);
		
		bizServiceInter=new BizMgzListService(sqlSession);
		bizServiceInter.execute(model);
		
		return "/biz/magazine/bizMgzList";
	}
	
	
	
	@RequestMapping("/biz/magazine/bizMgzWriteView")
	public String bizMgzWriteView() {
		
		System.out.println("controller bizMgzWriteView();");
		return "/biz/magazine/bizMgzWriteView";
	}

	
	
	@RequestMapping("/biz/magazine/bizMgzWrite")
	public String bizMgzWrite(MultipartHttpServletRequest mftRequest, Model model){
		System.out.println("controller bizMgzWrite();");
		
		model.addAttribute("mftRequest",mftRequest);
		bizServiceInter=new BizMgzWriteService(sqlSession);
		bizServiceInter.execute(model);
		
		return "redirect:bizMgzList";
	}


	@RequestMapping("/biz/magazine/bizMgzDownload")
	public String bizMgzDownload(HttpServletRequest request,HttpServletResponse response, Model model) throws Exception {
		System.out.println("controller bizMgzdownload();");
		
		String path=request.getParameter("p");
		String fname=request.getParameter("f");
		String bm_no=request.getParameter("bm_no");
		
		System.out.println("fname: "+fname);
		System.out.println("p: "+path);
		
		
		//다운로드 처리
		//아랫줄은 사용하지 않으면 파일이 브라우저에서 바로 열려버린다. 바로 열지말고 첨부파일으로 취급하는 명령
		response.setHeader("Content-Disposition", "Attachment;filename="
							+URLEncoder.encode(fname,"utf-8"));
		String attachPath="resources\\upload\\biz\\";
		String realPath=request.getSession().getServletContext().getRealPath(attachPath)+"\\"+fname;
		System.out.println("realPath : "+realPath);
		
//		스트링 연결
		FileInputStream fin=new FileInputStream(realPath);
		ServletOutputStream sout=response.getOutputStream();
		
		byte[] buf=new byte[1024];
		int size=0;
		while ((size=fin.read(buf,0,1024))!=-1) {
			sout.write(buf, 0, size);
		}
		fin.close();
		sout.close();
		
		return "bizMgzContentView?bm_no="+bm_no;
	}
	
	
	
	@RequestMapping("/biz/magazine/bizMgzContentView") 
	public String bizMgzContent(HttpServletRequest request,Model model) {
		System.out.println("controller bizMgzContentView();");	
		
		model.addAttribute("request",request);

		bizServiceInter=new BizMgzContentViewService(sqlSession);
		bizServiceInter.execute(model);
		
		return "/biz/magazine/bizMgzContentView";
	}

	
	
	@RequestMapping("/biz/magazine/bizMgzModView") 
	public String bizMgzModView(HttpServletRequest request,Model model) {
		System.out.println("controller bizMgzModView();");	
		
		model.addAttribute("request",request);
		
		bizServiceInter=new BizMgzModViewService(sqlSession);
		bizServiceInter.execute(model);
		
		return "/biz/magazine/bizMgzModView";
	}


	
	@RequestMapping(method = RequestMethod.POST,value = "/biz/magazine/bizMgzMod") 
	public String bizMgzMod(HttpServletRequest request,Model model) {
		System.out.println("controller bizMgzMod();");	
		
		model.addAttribute("request",request);
		
		bizServiceInter=new BizMgzModService(sqlSession);
		bizServiceInter.execute(model);
		
		return "redirect:bizMgzList";
	}
	
	
	
	@RequestMapping("/biz/magazine/bizMgzDelView") 
	public String bizMgzDelView(HttpServletRequest request,Model model) {
		System.out.println("controller bizMgzDelView();");	
		
		model.addAttribute("request",request);
		
		bizServiceInter=new BizMgzDelViewService(sqlSession);
		bizServiceInter.execute(model);
		
		return "/biz/magazine/bizMgzDelView";
	}
	
	
	
	@RequestMapping("/biz/magazine/bizMgzDel") 
	public String bizMgzDel(HttpServletRequest request,Model model) {
		System.out.println("controller bizMgzDel();");	
		
		model.addAttribute("request",request);
		
		String bm_no=request.getParameter("bm_no");
		
		System.out.println("bm_no: "+bm_no);
		bizServiceInter=new BizMgzDelService(sqlSession);
		bizServiceInter.execute(model);
		
		return "redirect:bizMgzList";
	}
	
		
}
