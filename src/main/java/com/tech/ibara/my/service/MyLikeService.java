package com.tech.ibara.my.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.my.dao.MyDao;
import com.tech.ibara.my.dto.MyMemberInfoDto;
import com.tech.ibara.oh.dao.OHInterfaceDao;

public class MyLikeService implements VService{
	private SqlSession sqlSession;
	private HttpSession session;
	public MyLikeService(SqlSession sqlSession,HttpSession session) {
		this.sqlSession=sqlSession;
		this.session=session;
	}
	@Override
	public void execute(Model model) {
		Map<String, Object> map=model.asMap();
		MyMemberInfoDto mdto=(MyMemberInfoDto) map.get("mdto");
		int memno = mdto.getMemno();
		MyDao mdao=sqlSession.getMapper(MyDao.class);
		int likePb= mdao.countLikePhotoBoard(memno);
		model.addAttribute("likePb",likePb);		
		
		OHInterfaceDao odao=sqlSession.getMapper(OHInterfaceDao.class);
//		ArrayList<OHPhotoBoard> pblikedto=odao.getPhotoBoardLikeList(memno); //int memno를 보내면 likeDTO가 조인된 모든 정보를 가져오는 쿼리를 부르는 메소드
//		model.addAttribute("likelist",pblikedto);
		
	}
	

}
