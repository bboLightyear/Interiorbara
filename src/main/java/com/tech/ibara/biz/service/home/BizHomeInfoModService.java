 package com.tech.ibara.biz.service.home;

import java.io.File;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tech.ibara.biz.dao.BizIDao;
import com.tech.ibara.biz.service.BizServiceInter;

@Service
public class BizHomeInfoModService implements BizServiceInter {

	private SqlSession sqlSession;

	public BizHomeInfoModService(SqlSession sqlSession) {
		// TODO Auto-generated constructor stub
		this.sqlSession=sqlSession;
	}

	@Override
	public void execute(Model model) {

		System.out.println("service BizHomeInfoModService>>>");
		
		Map<String, Object> map=model.asMap();
		MultipartHttpServletRequest mftRequest=(MultipartHttpServletRequest) map.get("mftRequest");
		
		BizIDao dao=sqlSession.getMapper(BizIDao.class);
		
		String bh_no = mftRequest.getParameter("bh_no");
		String inteno = mftRequest.getParameter("inteno");
		String bh_name = mftRequest.getParameter("bh_name");
		String bh_pro = mftRequest.getParameter("bh_pro");
		String bh_addr1 = mftRequest.getParameter("bh_addr1");
		String bh_addr2 = mftRequest.getParameter("bh_addr2");
		String bh_img = mftRequest.getParameter("bh_img");
		String bh_notice = mftRequest.getParameter("bh_notice");
		String bh_intro = mftRequest.getParameter("bh_intro");
		
		System.out.println("bh_no: "+bh_no);
		
		MultipartFile file=mftRequest.getFile("fileNew");
		
		model.addAttribute("bh_no");
		model.addAttribute("inteno");
		
		String bhImgNew="";
		String path="C:\\interiorbara01\\interiorbara01\\src\\main\\webapp\\resources\\upload\\biz\\home";
		String originFile=file.getOriginalFilename();
		System.out.println("오리진 파일 이름: "+originFile);
		long longtime=System.currentTimeMillis();
		String changeFile=longtime+"_"+file.getOriginalFilename();
		System.out.println("변형된 파일 이름: "+changeFile);
		String pathfile=path+"\\"+changeFile;
		
			try {
				if(!originFile.equals("")) {
					file.transferTo(new File(pathfile));
					bhImgNew=changeFile;
					System.out.println("변경된 이미지: "+bhImgNew);
				}else {
					bhImgNew=bh_img;
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
	
	System.out.println("bhImgNew:"+bhImgNew);
	
	
		dao.BizHomeInfoMod(bh_no, bhImgNew, bh_notice, bh_intro,
				bh_name, bh_pro, bh_addr1, bh_addr2, inteno);
		
		
		
		
		
		
	}

}
