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

import com.tech.ibara.biz.service.BizCasesContentViewService;
import com.tech.ibara.biz.service.BizCasesListService;
import com.tech.ibara.biz.service.BizCasesWriteService;
import com.tech.ibara.biz.service.BizMgzContentViewService;
import com.tech.ibara.biz.service.BizMgzDelService;
import com.tech.ibara.biz.service.BizMgzDelViewService;
import com.tech.ibara.biz.service.BizMgzListService;
import com.tech.ibara.biz.service.BizMgzModService;
import com.tech.ibara.biz.service.BizMgzModViewService;
import com.tech.ibara.biz.service.BizMgzWriteService;
import com.tech.ibara.biz.service.BizServiceInter;
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
		
		return "/biz/magazine/bizCasesContentView";
	}

	
	
//	@RequestMapping("/biz/magazine/bizMgzModView") 
//	public String bizMgzModView(HttpServletRequest request,Model model) {
//		System.out.println("controller bizMgzModView();");	
//		
//		model.addAttribute("request",request);
//		
//		bizServiceInter=new BizMgzModViewService(sqlSession);
//		bizServiceInter.execute(model);
//		
//		return "/biz/magazine/bizMgzModView";
//	}
//
//
//	
//	@RequestMapping(method = RequestMethod.POST,value = "/biz/magazine/bizMgzMod") 
//	public String bizMgzMod(HttpServletRequest request,Model model) {
//		System.out.println("controller bizMgzMod();");	
//		
//		model.addAttribute("request",request);
//		
//		bizServiceInter=new BizMgzModService(sqlSession);
//		bizServiceInter.execute(model);
//		
//		return "redirect:bizMgzList";
//	}
//	
//	@RequestMapping("/biz/magazine/bizMgzDelView") 
//	public String bizMgzDelView(HttpServletRequest request,Model model) {
//		System.out.println("controller bizMgzDelView();");	
//		
//		model.addAttribute("request",request);
//		
//		bizServiceInter=new BizMgzDelViewService(sqlSession);
//		bizServiceInter.execute(model);
//		
//		return "/biz/magazine/bizMgzDelView";
//	}
//	
//	@RequestMapping("/biz/magazine/bizMgzDel") 
//	public String bizMgzDel(HttpServletRequest request,Model model) {
//		System.out.println("controller bizMgzDel();");	
//		
//		model.addAttribute("request",request);
//		
//		String bm_no=request.getParameter("bm_no");
//		
//		System.out.println("bm_no: "+bm_no);
//		bizServiceInter=new BizMgzDelService(sqlSession);
//		bizServiceInter.execute(model);
//		
//		return "redirect:bizMgzList";
//	}
//	
	
	
	
	
	
	
	
	
	
	
	
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
