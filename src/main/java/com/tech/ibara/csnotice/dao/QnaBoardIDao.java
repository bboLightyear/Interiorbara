package com.tech.ibara.csnotice.dao;

import java.util.ArrayList;

import com.tech.ibara.csnotice.dto.QnaDto;

public interface QnaBoardIDao {

	public ArrayList<QnaDto> qnalist(int rowStart, int rowEnd, String searchKeyword, String string);

	public int selectBoardTotalCount1();
	public int selectBoardTotalCount2();
	public int selectBoardTotalCount3();
	public int selectBoardTotalCount4();
	public int selectBoardTotalCount5();
	public int selectBoardTotalCount6();

	public Integer selsnbno();

	public void qnawrite(String nbwrite, String nbtitle, String nbcontent, int snbno, String qnadiv);

	public void imgwrite(int snbno, String changeFile);

	public void uphit(String nbno);

	public QnaDto qnacontent(String nbno);

	public int selfilecode(String nbno);

	public void imgdelete(int filecode);

	public void qnadelete(String nbno);

}
