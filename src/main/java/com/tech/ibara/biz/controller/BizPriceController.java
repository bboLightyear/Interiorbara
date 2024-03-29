package com.tech.ibara.biz.controller;

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

import com.tech.ibara.biz.dao.BizPriceIDao;

@Controller
public class BizPriceController {

	@Autowired
	private SqlSession sqlSession;
	
	
	@RequestMapping(value = "/biz/bizPriceList", method = RequestMethod.GET)
	public String bizPriceList(HttpServletRequest request, Model model) {
		System.out.println("controller bizPriceList();");
//		세션에서 접속한 업체 번호 받아오기
//		String biz_idno=request.getParameter("biz_idno");
//		일단 임의로 40으로 입력해놓음
		String biz_idno = "40";
		int bizPriceCnt=0;
		BizPriceIDao dao = sqlSession.getMapper(BizPriceIDao.class);
		bizPriceCnt=dao.bizPriceCnt(biz_idno);
		model.addAttribute("biz_idno", biz_idno);
		System.out.println("priceCnt: "+bizPriceCnt);
		
		if(bizPriceCnt==0) {			
			return "redirect:bizPriceWriteView";			
		}else {

			return "/biz/bizPriceListView";
		}
	}
	

	
	 @RequestMapping("/biz/bizPriceWriteView")
	 public String bizPriceWriteView(HttpServletRequest request, Model model) {
	 
		 System.out.println("controller bizPriceWriteView();");
		 BizPriceIDao dao = sqlSession.getMapper(BizPriceIDao.class);
			ArrayList<String>[] bizPriceTagList = new ArrayList[16];
			
			for (int i = 0; i < bizPriceTagList.length; i++) {
				bizPriceTagList[i]=new ArrayList<String>();
			}
			
			for (int i = 0; i < bizPriceTagList.length; i+=2) {
				bizPriceTagList[i].add("프리미엄");
				bizPriceTagList[i+1].add("스탠다드");
			}
			

			for (int i = 0; i < 2; i++) {				
				bizPriceTagList[0+i].add("마루");
				bizPriceTagList[2+i].add("도배/페인트");
				bizPriceTagList[4+i].add("장판/타일");
				bizPriceTagList[6+i].add("욕실");
				bizPriceTagList[8+i].add("주방");
				bizPriceTagList[10+i].add("문/샷시");
				bizPriceTagList[12+i].add("조명");
				bizPriceTagList[14+i].add("시트/필름");				
			}
			

			for (int i = 0; i < bizPriceTagList.length; i++) {
				System.out.println(bizPriceTagList[i]);
			}
		 
		 model.addAttribute("bizPriceTagList", bizPriceTagList);
		 
		 
	 return "/biz/bizPriceWriteView";
	 
	 }
	 

	 
	 @RequestMapping("/biz/bizPriceWrite")
	 public String bizPriceWrite(MultipartHttpServletRequest mftRequest, Model model) {
		 
		 System.out.println("controller bizPriceWrite();");
		
		
		 String[] bp_type = mftRequest.getParameterValues("bp_type");
		 String[] bp_category = mftRequest.getParameterValues("bp_category");
		 String[] bp_name = mftRequest.getParameterValues("bp_name");
		 String[] bp_content = mftRequest.getParameterValues("bp_content");
		 String[] bp_price = mftRequest.getParameterValues("bp_price");
		 String biz_idno=mftRequest.getParameter("biz_idno");

		 BizPriceIDao dao=sqlSession.getMapper(BizPriceIDao.class);
		 
		 
		 for (int i = 0; i < bp_price.length; i++) {
			System.out.println("bp_type[0]: "+bp_type[0]);
			dao.bizPriceWrite(bp_name[i], bp_content[i], bp_price[i],
					bp_category[i], bp_type[i], "NullFile", biz_idno);
		}
		 	
			
			
			
//			System.out.println("bp_type: "+bp_type);
//			System.out.println("bp_category: "+bp_category);
//			System.out.println("bp_name: "+bp_name);
//			System.out.println("bp_content: "+bp_content);
//			System.out.println("bp_price: "+bp_price);
//			System.out.println("biz_idno: "+biz_idno);

			
//			최근의 글번호 가져오기
			int bp_no=dao.selBp_no();
			
		 String path="C:\\23setspring\\springwork23\\interiorbara_simi\\src\\main\\webapp\\resources\\upload\\biz\\price";
		 
		 List<MultipartFile> fileList=mftRequest.getFiles("file");
		 

			for (MultipartFile mf : fileList) {
				String originFile=mf.getOriginalFilename();
				System.out.println("오리진 파일 이름: "+originFile);
				long longtime=System.currentTimeMillis();
				String changeFile=longtime+"_"+mf.getOriginalFilename();
				System.out.println("변형된 파일 이름: "+changeFile);
				String pathfile=path+"\\"+changeFile;
				try {
			            if(!originFile.equals("")) {
			               mf.transferTo(new File(pathfile));
			               // setFileUpload() 함수 실행 -> DB에 파일명 INSERT
			               dao.bizPriceImgWrite(bp_no, changeFile);
			               System.out.println("자재 사진 파일 업로드 성공");
			            }
			         } catch (Exception e) {
			            // TODO: handle exception
			        	 e.printStackTrace();
			         }
			      }

	 return "redirect:bizPriceList";
	 
	 }
	 



}
