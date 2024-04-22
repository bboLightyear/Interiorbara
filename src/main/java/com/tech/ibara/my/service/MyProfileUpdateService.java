package com.tech.ibara.my.service;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.tech.ibara.my.dao.MyDao;
import com.tech.ibara.my.dto.MyMemberInfoDto;

public class MyProfileUpdateService implements VService {
	private SqlSession sqlSession;
	private HttpSession session;
	public MyProfileUpdateService(SqlSession sqlSession,HttpSession session) {
		this.sqlSession=sqlSession;
		this.session=session;
	}
	@Override
	public void execute(Model model) {
		System.out.println("MyProfileUpdateService");
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
//		String memtype=(String) map.get("memtype");
//		System.out.println("memtype : "+memtype );
//		session = request.getSession();					
		String path="C:\\23setspring\\springwork23\\interiorbara01\\src\\main\\webapp\\resources\\upload\\my";
		
		MultipartHttpServletRequest mpreq=(MultipartHttpServletRequest) request;
		String memno=mpreq.getParameter("memno");
		System.out.println("memno : "+memno);
		MultipartFile file=mpreq.getFile("profileimg");
		String originFile=file.getOriginalFilename();
		System.out.println("오리진 파일 이름 : "+originFile);
		long longtime=System.currentTimeMillis();
		String changeFile=longtime+"_"+originFile;
		System.out.println("변환된 파일 이름 : "+changeFile);	
		
		String pathfile=path+"\\"+changeFile;
		int result=0;
		MyDao mdao=sqlSession.getMapper(MyDao.class);
		try {
			if(!originFile.equals("")) {
				file.transferTo(new File(pathfile));
				result = mdao.updateProfileimg(changeFile,memno);
			}else {//선택한 파일이 없으면 프로필사진을 삭제
				result = mdao.updateProfileimg(originFile, memno);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("updateprofileimg result : "+result);
		MyMemberInfoDto memdto;
		String memtype=mdao.getMemtype(memno);
		int intmemno=Integer.parseInt(memno);
		if(result==1) {
			if(memtype.equals("INTERIOR")) {
				memdto=mdao.getInteriorMember(intmemno);
			}else if(memtype.equals("SELLER")) {
				memdto=mdao.getSellerMember(intmemno);
			}else {
				memdto=mdao.getMemberInfo("1",memno);
			}			
			session.removeAttribute("loginUserDto");
			session.setAttribute("loginUserDto",memdto);
		}		
	}
		
}
