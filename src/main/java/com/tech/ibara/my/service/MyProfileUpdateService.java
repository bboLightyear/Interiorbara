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

public class MyProfileUpdateService implements VService {
	private SqlSession sqlSession;
	public MyProfileUpdateService(SqlSession sqlSession) {
		this.sqlSession=sqlSession;
	}
	@Override
	public void execute(Model model) {
		System.out.println("MyProfileUpdateService");
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
					
		String path="C:\\23setspring\\springwork23\\interiorbara00\\src\\main\\webapp\\resources\\upload\\my";
		
		MultipartHttpServletRequest mpreq=(MultipartHttpServletRequest) request;
		MultipartFile file=mpreq.getFile("profileimg");
		String originFile=file.getOriginalFilename();
		System.out.println("오리진 파일 이름 : "+originFile);
		long longtime=System.currentTimeMillis();
		String changeFile=longtime+"_"+originFile;
		System.out.println("변환된 파일 이름 : "+changeFile);
						
		HttpSession session=request.getSession();
		String nickname=(String) session.getAttribute("sessionNickname");
		System.out.println("nickname : "+nickname);
		String pathfile=path+"\\"+changeFile;
		try {
			if(!originFile.equals("")) {
				file.transferTo(new File(pathfile));
				MyDao mdao=sqlSession.getMapper(MyDao.class);
				int result = mdao.updateProfileimg(changeFile,nickname);
				System.out.println("updateprofileimg result : "+result);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
	}		
		
}
