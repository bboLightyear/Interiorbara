package com.tech.ibara.my.service;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.my.dao.MyDao;
import com.tech.ibara.my.dto.MyMemberInfoDto;

public class MypageMainService implements VService{
	private SqlSession sqlSession;
	private HttpSession session;
	public MypageMainService(SqlSession sqlSession,HttpSession session) {
		this.sqlSession=sqlSession;
		this.session=session;
	}
	@Override
	public void execute(Model model) {
		MyDao mdao=sqlSession.getMapper(MyDao.class);
		MyMemberInfoDto mdto=(MyMemberInfoDto) session.getAttribute("loginUserDto");
		int memno=mdto.getMemno();
		int likePB= mdao.countLikePhotoBoard(memno);
		int likePR= mdao.countLikePhotoReply(memno);
		int scrapPB= mdao.countScrapPhotoBoard(memno);
		int bmarkbiz=mdao.countBizBmark(memno);
		
		int mylike=likePB+likePR;
		int myscrap=scrapPB+bmarkbiz;
		
		System.out.println("mylike : "+mylike);
		System.out.println("myscrap : "+myscrap);
		
		model.addAttribute("mylike",mylike);
		model.addAttribute("myscrap",myscrap);
	}
	

}
