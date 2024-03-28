package com.tech.ibara.biz.dao;

import java.util.ArrayList;

import com.tech.ibara.biz.dto.BizCasesDto;
import com.tech.ibara.biz.dto.BizCasesImgDto;
import com.tech.ibara.biz.dto.BizMgzDto;
import com.tech.ibara.biz.dto.BizMgzImgDto;

public interface BizIDao {

//	매거진 게시판 쿼리
	
	public ArrayList<BizMgzDto> bizMgzList(int rowStart, int rowEnd, String searchKeyword, String selNum);

	public BizMgzDto bizMgzContentView(String bm_no);

	public void bizMgzUpHit(String bm_no);

	public void bizMgzMod(String bm_no, String bm_title, String bm_content);

	public BizMgzDto bizMgzDelView(String bm_no);
	
	public void bizMgzDel(String bm_no);
	
	public void bizMgzImgDel(String bm_no);

	public void bizMgzWrite(String bm_title, String bm_content, String bm_writer, String user_idno);

	public int selectBoardTotalCount1(String searchKeyword);

	public int selectBoardTotalCount2(String searchKeyword);

	public int selectBoardTotalCount3(String searchKeyword);

	public int selectBoardTotalCount4(String searchKeyword);

	public int selBm_no();
	
	public void bizMgzImgWrite(int bm_no, String originFile, String changeFile);
	
	public ArrayList<BizMgzImgDto> selectBizMgzImg(String bm_no);

//	시공사례 게시판 쿼리
	
	public ArrayList<BizCasesDto> bizCasesList(int rowStart, int rowEnd, String searchKeyword, String string);

	public void bizCasesWrite(String bc_title, String bc_content, String bc_writer, String user_idno);

	public int selBc_no();

	public void bizCasesImgWrite(int bc_no, String originFile, String changeFile);

	public void bizCasesUpHit(String bc_no);

	public BizCasesDto bizCasesContentView(String bc_no);

	public ArrayList<BizCasesImgDto> selectBizCasesImg(String bc_no);




	
}
