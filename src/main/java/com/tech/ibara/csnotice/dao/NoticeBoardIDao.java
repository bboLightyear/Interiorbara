package com.tech.ibara.csnotice.dao;

import java.util.ArrayList;

import com.tech.ibara.csnotice.dto.NoticeDto;
import com.tech.ibara.csnotice.dto.NoticeImgDto;
import com.tech.ibara.csnotice.dto.NoticeReplyDto;
import com.tech.ibara.csnotice.dto.QnaDto;
import com.tech.ibara.csnotice.dto.QnaImgDto;
import com.tech.ibara.csnotice.dto.QnaReplyDto;

public interface NoticeBoardIDao {

	public ArrayList<NoticeDto> noticelist(int rowStart, int rowEnd, String searchKeyword, String string);

	public int selectBoardTotalCount1();
	public int selectBoardTotalCount2();
	public int selectBoardTotalCount3();
	public int selectBoardTotalCount4();
	public int selectBoardTotalCount5();
	public int selectBoardTotalCount6();

	public Integer selsnbno();

	public Integer selfilecode(String qbno);

	public void noticewrite(String qbwrite, String qbtitle, String qbcontent, int sqbno, String qnadiv);

	public void imgwrite(int sqbno, String changeFile);

	public void uphit(String qbno);

	public NoticeDto noticecontent(String qbno);

	public NoticeDto noticecontentview(String qbno);

	public void imgdelete(int filecode);

	public void noticedelete(String qbno);

	public ArrayList<NoticeImgDto> noticecontentimgview(String qbno);

	public void noticereply(String qbno, String qnareply, String qnarewriter);

	public ArrayList<NoticeReplyDto> replylist(String qbno);

	public ArrayList<NoticeReplyDto> replyrlist(String rqbno);

	public Integer replycnt(String qbno);

	public void noticereply_r(String qbno, String rqbno, String rwriter, String rcontent, String rqbgroup, String rqbstep, String rqbindent);

	public void replyShape(String rqbgroup, String rqbstep);

	public void noticeeditproc(String qbno, String qbtitle, String qbcontent, String qnadiv);

	public ArrayList<String> getfileListbefore(Integer selfilecode);

	public void deletefilebefore(Integer filecode);

	public void editimg(int sqbno, String changeFile);

	public ArrayList<NoticeImgDto> imglist(Integer selfilecode);

	
}
