package com.tech.ibara.biz.service.review;

import java.io.File;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tech.ibara.biz.dao.BizIDao;
import com.tech.ibara.biz.service.BizServiceInter;

@Service
public class BizRvWriteService implements BizServiceInter {

	private SqlSession sqlSession;
	
	public BizRvWriteService(SqlSession sqlSession) {
		// TODO Auto-generated constructor stub
		this.sqlSession=sqlSession;
	}

	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub

		System.out.println("service BizRvWriteService>>>");
		
		Map<String, Object> map=model.asMap();
		MultipartHttpServletRequest mftRequest=(MultipartHttpServletRequest) map.get("mftRequest");
		
		String br_content=mftRequest.getParameter("br_content");
		String br_writer=mftRequest.getParameter("br_writer");
		String br_point=mftRequest.getParameter("br_point");
		String biz_idno=mftRequest.getParameter("biz_idno");
		String user_idno=mftRequest.getParameter("user_idno");
		
		System.out.println("br_content: "+br_content);
		System.out.println("br_writer: "+br_writer);
		System.out.println("br_point: "+br_point);
		System.out.println("user_idno: "+user_idno);
		System.out.println("biz_idno: "+biz_idno);
		
		BizIDao dao=sqlSession.getMapper(BizIDao.class);
		dao.bizRvWrite(br_content,br_writer,br_point, biz_idno, user_idno);
		
//		최근의 글번호 가져오기
		int br_no=dao.selBr_no();
		System.out.println("br_no: "+br_no);
		
		//show in sys explorer로 열어서 주소복사함
		String path="C:\\23setspring\\springwork23\\interiorbara_simi\\src\\main\\webapp\\resources\\upload\\biz\\review";
//		MultipartRequest req=
//				new MultipartRequest(mftRequest, path, 1024*1024*10,"utf-8", new DefaultFileRenamePolicy());
//		
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
		               dao.bizRvImgWrite(br_no, originFile, changeFile);
		               System.out.println("다중 파일 업로드 성공");
		            }
		         } catch (Exception e) {
		            // TODO: handle exception
		        	 e.printStackTrace();
		         }
		      }

		
	}

}

