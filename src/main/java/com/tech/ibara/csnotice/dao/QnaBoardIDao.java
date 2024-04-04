package com.tech.ibara.csnotice.dao;

import java.util.ArrayList;

import com.tech.ibara.csnotice.dto.QnaDto;
import com.tech.ibara.csnotice.dto.QnaImgDto;
import com.tech.ibara.csnotice.dto.QnaReplyDto;

public interface QnaBoardIDao {

	public ArrayList<QnaDto> qnalist(int rowStart, int rowEnd, String searchKeyword, String string);

	public int selectBoardTotalCount1();
	public int selectBoardTotalCount2();
	public int selectBoardTotalCount3();
	public int selectBoardTotalCount4();
	public int selectBoardTotalCount5();
	public int selectBoardTotalCount6();

	public Integer selsqbno();

	public Integer selfilecode(String qbno);

	public void qnawrite(String qbwrite, String qbtitle, String qbcontent, int sqbno, String qnadiv);

	public void imgwrite(int sqbno, String changeFile);

	public void uphit(String qbno);

	public QnaDto qnacontent(String qbno);

	public QnaDto qnacontentview(String qbno);

	public void imgdelete(int filecode);

	public void qnadelete(String qbno);

	public ArrayList<QnaImgDto> qnacontentimgview(String qbno);

	public void qnareply(String qbno, String qnareply, String qnarewriter);

	public ArrayList<QnaReplyDto> replylist(String qbno);

	public ArrayList<QnaReplyDto> replyrlist(String rqbno);

	public Integer replycnt(String qbno);

	public void qnareply_r(String qbno, String rqbno, String rwriter, String rcontent, String rqbgroup, String rqbstep, String rqbindent);

	public void replyShape(String rqbgroup, String rqbstep);

	public void qnaeditproc(String qbno, String qbtitle, String qbcontent, String qnadiv);

	public ArrayList<String> getfileListbefore(Integer selfilecode);

	public void deletefilebefore(Integer filecode);

	public void editimg(int sqbno, String changeFile);

	public ArrayList<QnaImgDto> imglist(Integer selfilecode);

	
}
