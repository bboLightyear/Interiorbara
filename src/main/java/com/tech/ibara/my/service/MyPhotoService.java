package com.tech.ibara.my.service;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.my.dao.MyDao;
import com.tech.ibara.my.dto.MyMemberInfoDto;
import com.tech.ibara.my.dto.PhotoAttachDto;

public class MyPhotoService implements VService{
	private SqlSession sqlSession;
	private HttpSession session;
	public MyPhotoService(SqlSession sqlSession,HttpSession session) {
		this.sqlSession=sqlSession;
		this.session=session;
	}
	@Override
	public void execute(Model model) {
		Map<String, Object> map=model.asMap();
		MyMemberInfoDto mdto=(MyMemberInfoDto) map.get("mdto");
		int memno = mdto.getMemno();
		
		MyDao mdao=sqlSession.getMapper(MyDao.class);
		ArrayList<PhotoAttachDto> palist=mdao.getMyPhotoBoardList(memno);
		model.addAttribute("palist",palist);
		
	}
	

}
