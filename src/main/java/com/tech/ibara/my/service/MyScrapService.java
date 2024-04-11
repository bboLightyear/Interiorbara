package com.tech.ibara.my.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.tech.ibara.biz.dao.BizIDao;
import com.tech.ibara.biz.dto.BizHomeDto;
import com.tech.ibara.my.dao.MyDao;
import com.tech.ibara.my.dto.MyMemberInfoDto;
import com.tech.ibara.oh.dao.OHInterfaceDao;
import com.tech.ibara.oh.dto.OHPhotoBoard;

public class MyScrapService implements VService{
	private SqlSession sqlSession;
	private HttpSession session;
	public MyScrapService(SqlSession sqlSession,HttpSession session) {
		this.sqlSession=sqlSession;
		this.session=session;
	}
	@Override
	public void execute(Model model) {
		MyMemberInfoDto mdto=(MyMemberInfoDto) session.getAttribute("loginUserDto");
		int memno = mdto.getMemno();
						
		MyDao mdao=sqlSession.getMapper(MyDao.class);
		int scrapPb= mdao.countScrapPhotoBoard(memno);
		int bmarkBiz=mdao.countBizBmark(memno);
				
		model.addAttribute("scrapPb",scrapPb);
		model.addAttribute("bmarkBiz",bmarkBiz);
		
//		MyDao mdao=sqlSession.getMapper(MyDao.class);
		BizIDao bdao=sqlSession.getMapper(BizIDao.class);
//		ArrayList<BizHomeDto> bhdto=bdao.getBmarkedHomesByUserMy(memno); //비즈북마크된 비즈홈정보를 가져오는 메소드
//		model.addAttribute("bhlist",bhdto); //북마크된 비즈홈정보를 jsp로 보내주기
		
		OHInterfaceDao odao=sqlSession.getMapper(OHInterfaceDao.class);
//		ArrayList<OHPhotoBoard> pblikedto=odao.getPhotoBoardLikeList(memno); //int memno를 보내면 likeDTO가 조인된 모든 정보를 가져오는 쿼리를 부르는 메소드
//		ArrayList<OHPhotoBoard> pbscrapdto=odao.getPhotoBoardScrapList(memno); //int memno를 보내면 scrapDTO가 조인된 모든 정보를 가져오는 쿼리를 부르는 메소드
//		model.addAttribute("scraplist",pbscrapdto);
		
		
	}
	

}
