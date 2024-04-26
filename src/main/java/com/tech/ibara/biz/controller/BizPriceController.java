package com.tech.ibara.biz.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tech.ibara.biz.dao.BizIDao;
import com.tech.ibara.biz.dao.BizPriceIDao;
import com.tech.ibara.biz.dto.BizPriceDto;
import com.tech.ibara.biz.service.review.BizRvListService;
import com.tech.ibara.biz.vo.BizSearchVO;

@Controller
public class BizPriceController {

	@Autowired
	private SqlSession sqlSession;
	
	
	@RequestMapping("/biz/bizPriceList")
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
			return "redirect:bizPriceListView";
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
		 List<MultipartFile> fileList=mftRequest.getFiles("file");

		 model.addAttribute("biz_idno");
		 
		 BizPriceIDao dao=sqlSession.getMapper(BizPriceIDao.class);
		 
				 
		 
		 for (int i = 0; i < bp_price.length; i++) {
			System.out.println("bp_type[0]: "+bp_type[0]);
			
			dao.bizPriceWrite(bp_name[i], bp_content[i], bp_price[i],
					bp_category[i], bp_type[i], "NullFile", biz_idno);
			
//			최근의 글번호 가져오기
			int bp_no=dao.selBp_no();
			String path="C:\\23setspring\\springwork23\\interiorbara_simi\\src\\main\\webapp\\resources\\upload\\biz\\price";
			 
					String originFile=fileList.get(i).getOriginalFilename();
					System.out.println("오리진 파일 이름: "+originFile);
					long longtime=System.currentTimeMillis();
					String changeFile=longtime+"_"+fileList.get(i).getOriginalFilename();
					System.out.println("변형된 파일 이름: "+changeFile);
					String pathfile=path+"\\"+changeFile;
					try {
				            if(!originFile.equals("")) {
				            	fileList.get(i).transferTo(new File(pathfile));
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
	 
		
		@RequestMapping("/biz/bizPriceListView")
		public String bizPriceListView(HttpServletRequest request, Model model) {
			System.out.println("controller bizPriceListView();");	
			
			 BizPriceIDao dao=sqlSession.getMapper(BizPriceIDao.class);
			 
			 String biz_idno=request.getParameter("biz_idno");
			 System.out.println("biz_idno: "+biz_idno);
			
			 int bizPriceCnt=0;
			 bizPriceCnt=dao.bizPriceCnt(biz_idno);
			 
			 ArrayList<BizPriceDto> bizPriceListView=dao.bizPriceListView(biz_idno);
			 
				model.addAttribute("bizPriceListView", bizPriceListView);
				model.addAttribute("totalRow", bizPriceCnt);
				model.addAttribute("biz_idno", biz_idno);
			 
			return "/biz/bizPriceListView";
		
		}
	 
		@RequestMapping("/biz/bizPriceModAllView")
		public String bizPriceModAllView(HttpServletRequest request, Model model) {
			System.out.println("controller bizPriceListView();");	
			
			 BizPriceIDao dao=sqlSession.getMapper(BizPriceIDao.class);
			 
			 String biz_idno=request.getParameter("biz_idno");
			 System.out.println("biz_idno: "+biz_idno);
			
			 int bizPriceCnt=0;
			 bizPriceCnt=dao.bizPriceCnt(biz_idno);
			 
			 ArrayList<BizPriceDto> bizPriceListView=dao.bizPriceListView(biz_idno);
			 
			 
			 
				model.addAttribute("bizPriceListView", bizPriceListView);
				model.addAttribute("totalRow", bizPriceCnt);
			 
			return "/biz/bizPriceModAllView";
		
		}

		@RequestMapping("/biz/bizPriceModAll")
		public String bizPriceModAll(MultipartHttpServletRequest mftRequest, Model model) {
			System.out.println("controller bizPriceModAll();");
			
			
			String[] bp_no = mftRequest.getParameterValues("bp_no");
			 String[] bp_type = mftRequest.getParameterValues("bp_type");
			 String[] bp_category = mftRequest.getParameterValues("bp_category");
			 String[] bp_name = mftRequest.getParameterValues("bp_name");
			 String[] bp_content = mftRequest.getParameterValues("bp_content");
			 String[] bp_price = mftRequest.getParameterValues("bp_price");
			 String[] bp_img = mftRequest.getParameterValues("bp_img");
			 String biz_idno=mftRequest.getParameter("biz_idno");
			 List<MultipartFile> fileList=mftRequest.getFiles("fileNew");
			 
			 model.addAttribute("biz_idno");
			 
			 BizPriceIDao dao=sqlSession.getMapper(BizPriceIDao.class);
			 
					 
			 
			 for (int i = 0; i < bp_price.length; i++) {
				
				
				String bpImgNew="";
					String path="C:\\23setspring\\springwork23\\interiorbara_simi\\src\\main\\webapp\\resources\\upload\\biz\\price";
					String originFile=fileList.get(i).getOriginalFilename();
					System.out.println("오리진 파일 이름: "+originFile);
					long longtime=System.currentTimeMillis();
					String changeFile=longtime+"_"+fileList.get(i).getOriginalFilename();
					System.out.println("변형된 파일 이름: "+changeFile);
					String pathfile=path+"\\"+changeFile;
					
						try {
							if(!originFile.equals("")) {
								fileList.get(i).transferTo(new File(pathfile));
								bpImgNew=changeFile;
								System.out.println("변경된 이미지: "+bpImgNew);
							}else {
						    	  bpImgNew=bp_img[i];
							}
						} catch (Exception e) {
							// TODO: handle exception
							e.printStackTrace();
						}
				
				System.out.println("bpImgNew:"+bpImgNew);
				
				
					dao.bizPriceModAll(bp_no[i], bp_name[i], bp_content[i], bp_price[i],
							bp_category[i], bp_type[i], bpImgNew, biz_idno);
					
				}
				
			 		
			 return "redirect:bizPriceList";
		
		}

		@RequestMapping("/biz/bizPriceModEachView")
		public String bizPriceModEachView(HttpServletRequest request, Model model) {
			System.out.println("controller bizPriceModEachView();");	
			
			 BizPriceIDao dao=sqlSession.getMapper(BizPriceIDao.class);
			 
			 String bp_no=request.getParameter("bp_no");
			 String biz_idno=request.getParameter("biz_idno");
			 System.out.println("bp_no: "+bp_no);
			 System.out.println("biz_idno: "+biz_idno);
		
			 
			 BizPriceDto eachDto=dao.bizPriceModEachView(biz_idno, bp_no);
			 	model.addAttribute("eachDto", eachDto);
			 
			return "/biz/bizPriceModEachView";
		
		}

		@RequestMapping("/biz/bizPriceModEach")
		public String bizPriceModEach(MultipartHttpServletRequest mftRequest, Model model) {
			System.out.println("controller bizPriceModEach();");
			
			
			String bp_no = mftRequest.getParameter("bp_no");
			 String bp_type = mftRequest.getParameter("bp_type");
			 String bp_category = mftRequest.getParameter("bp_category");
			 String bp_name = mftRequest.getParameter("bp_name");
			 String bp_content = mftRequest.getParameter("bp_content");
			 String bp_price = mftRequest.getParameter("bp_price");
			 String bp_img = mftRequest.getParameter("bp_img");
			 String biz_idno=mftRequest.getParameter("biz_idno");
			 MultipartFile file=mftRequest.getFile("fileNew");
			 
			 model.addAttribute("biz_idno");
			 
			 BizPriceIDao dao=sqlSession.getMapper(BizPriceIDao.class);
			 

				String bpImgNew="";
					String path="C:\\23setspring\\springwork23\\interiorbara_simi\\src\\main\\webapp\\resources\\upload\\biz\\price";
					String originFile=file.getOriginalFilename();
					System.out.println("오리진 파일 이름: "+originFile);
					long longtime=System.currentTimeMillis();
					String changeFile=longtime+"_"+file.getOriginalFilename();
					System.out.println("변형된 파일 이름: "+changeFile);
					String pathfile=path+"\\"+changeFile;
					
						try {
							if(!originFile.equals("")) {
								file.transferTo(new File(pathfile));
								bpImgNew=changeFile;
								System.out.println("변경된 이미지: "+bpImgNew);
							}else {
						    	  bpImgNew=bp_img;
							}
						} catch (Exception e) {
							// TODO: handle exception
							e.printStackTrace();
						}
				
				System.out.println("bpImgNew:"+bpImgNew);
				
				
					dao.bizPriceModEach(bp_no, bp_name, bp_content, bp_price,
							bp_category, bp_type, bpImgNew, biz_idno);
					
				
			 		
			 return "redirect:bizPriceList";
		
		}
		
		

}
