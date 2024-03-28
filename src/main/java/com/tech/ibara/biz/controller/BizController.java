package com.tech.ibara.biz.controller;

import java.io.FileInputStream;
import java.net.URLEncoder;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tech.ibara.biz.service.BizServiceInter;
import com.tech.ibara.biz.service.cases.BizCasesContentViewService;
import com.tech.ibara.biz.service.cases.BizCasesDelService;
import com.tech.ibara.biz.service.cases.BizCasesDelViewService;
import com.tech.ibara.biz.service.cases.BizCasesListService;
import com.tech.ibara.biz.service.cases.BizCasesModService;
import com.tech.ibara.biz.service.cases.BizCasesModViewService;
import com.tech.ibara.biz.service.cases.BizCasesWriteService;
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
import com.tech.ibara.biz.service.review.BizRvListService;
import com.tech.ibara.biz.service.review.BizRvModDelViewService;
import com.tech.ibara.biz.service.review.BizRvModService;
import com.tech.ibara.biz.service.review.BizRvReportResultViewService;
import com.tech.ibara.biz.service.review.BizRvReportService;
import com.tech.ibara.biz.service.review.BizRvReportViewService;
import com.tech.ibara.biz.service.review.BizRvWriteService;
import com.tech.ibara.biz.vo.BizSearchVO;

@Controller
public class BizController {

	private BizServiceInter bizServiceInter;

	@Autowired
	private SqlSession sqlSession;
	
//	@Autowired
//	private SqlSession sqlSession;
//	
//	private static final Logger logger=LoggerFactory.getLogger(BizController.class);
//	
//	
//	@RequestMapping("/errors/error500")
//	public String error500(Model model) {
//		
//		System.out.println("/errors/error500()");
//		
//		return "/errors/error500";
//	}
	
//	@RequestMapping("/biz/search/bizAddrSearch")
//	public String bizAddrSearch(HttpServletRequest request, Model model) {
//		
//		System.out.println("bizAddrSearch();");
//		
//		model.addAttribute("sqlSession", sqlSession);
//		model.addAttribute("request", request);
//		
//		bizServiceInter=new BizAddrSearchService();
//		bizServiceInter.execute(model);
//
//		return "biz/search/bizAddrSearch";
//	}
	
	
	
	
	

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
	
	
	
	@RequestMapping("/biz/review/bizRvWriteView")
	public String bizRvWriteView() {
		
		System.out.println("controller bizRvWriteView();");
		return "/biz/review/bizRvWriteView";
	}

	
	
	@RequestMapping("/biz/review/bizRvWrite")
	public String bizRvWrite(MultipartHttpServletRequest mftRequest, Model model){
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
		System.out.println("controller bizMgzContentView();");	
		
		model.addAttribute("request",request);

		bizServiceInter=new BizRvContentViewService(sqlSession);
		bizServiceInter.execute(model);
		
		return "/biz/review/bizRvContentView";
	}

	
	
	@RequestMapping("/biz/review/bizRvModDelView") 
	public String bizRvModDelView(HttpServletRequest request,Model model) {
		System.out.println("controller bizRvModDelView();");	
		
		model.addAttribute("request",request);
		
		bizServiceInter=new BizRvModDelViewService(sqlSession);
		bizServiceInter.execute(model);
		
		return "/biz/review/bizRvModDelView";
	}


	
	@RequestMapping(method = RequestMethod.POST,value = "/biz/review/bizRvMod") 
	public String bizRvMod(HttpServletRequest request,Model model) {
		System.out.println("controller bizRvMod();");	
		
		model.addAttribute("request",request);
		
		bizServiceInter=new BizRvModService(sqlSession);
		bizServiceInter.execute(model);
		
		return "redirect:bizRvList";
	}
	

	
	
	
	@RequestMapping("/biz/review/bizRvDel") 
	public String bizRvDel(HttpServletRequest request,Model model) {
		System.out.println("controller bizRvDel();");	
		
		model.addAttribute("request",request);
		
		String br_no=request.getParameter("br_no");
		
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

	@RequestMapping("/biz/cases/bizCasesList") 
	public String bizCasesList(HttpServletRequest request,BizSearchVO searchVO,Model model) {
		System.out.println("controller bizCasesList();");	
		
		model.addAttribute("request",request);
		model.addAttribute("searchVO",searchVO);
		
		bizServiceInter=new BizCasesListService(sqlSession);
		bizServiceInter.execute(model);
		
		return "/biz/cases/bizCasesList";
	}
	
	

	@RequestMapping("/biz/cases/bizCasesWriteView")
	public String bizCasesWriteView() {
		
		System.out.println("controller bizCasesWriteView();");
		return "/biz/cases/bizCasesWriteView";
	}



	@RequestMapping("/biz/cases/bizCasesWrite")
	public String bizCasesWrite(MultipartHttpServletRequest mftRequest, Model model){
		System.out.println("controller bizCasesWrite();");
		
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
