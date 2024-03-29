package com.tech.ibara.biz.dao;

import java.sql.Timestamp;
import java.util.ArrayList;

import com.tech.ibara.biz.dto.BizCasesDto;
import com.tech.ibara.biz.dto.BizCasesImgDto;
import com.tech.ibara.biz.dto.BizMgzDto;
import com.tech.ibara.biz.dto.BizMgzImgDto;
import com.tech.ibara.biz.dto.BizRvDto;
import com.tech.ibara.biz.dto.BizRvImgDto;

public interface BizIDao {

	
	
	
//	시공사례 게시판 메소드
	
	public ArrayList<BizCasesDto> bizCasesList(int rowStart, int rowEnd, String searchKeyword, String string);

	public void bizCasesWrite(String bc_title, String bc_content, String bc_writer, String user_idno);

	public int selBc_no();

	public void bizCasesImgWrite(int bc_no, String originFile, String changeFile);

	public void bizCasesUpHit(String bc_no);

	public BizCasesDto bizCasesContentView(String bc_no);

	public ArrayList<BizCasesImgDto> selectBizCasesImg(String bc_no);

	public void bizCasesMod(String bc_no, String bc_title, String bc_content);

	public BizCasesDto bizCasesDelView(String bc_no);

	public void bizCasesDel(String bc_no);

	public void bizCasesImgDel(String bc_no);

	public int selectCasesTotalCount1(String searchKeyword);

	public int selectCasesTotalCount2(String searchKeyword);

	public int selectCasesTotalCount3(String searchKeyword);

	public int selectCasesTotalCount4(String searchKeyword);
	
	
//	매거진 게시판 메소드
	
	public ArrayList<BizMgzDto> bizMgzList(int rowStart, int rowEnd, String searchKeyword, String selNum);

	public BizMgzDto bizMgzContentView(String bm_no);

	public void bizMgzUpHit(String bm_no);

	public void bizMgzMod(String bm_no, String bm_title, String bm_content);

	public BizMgzDto bizMgzDelView(String bm_no);
	
	public void bizMgzDel(String bm_no);
	
	public void bizMgzImgDel(String bm_no);

	public void bizMgzWrite(String bm_title, String bm_content, String bm_writer, String user_idno);

	public int selectMgzTotalCount1(String searchKeyword);

	public int selectMgzTotalCount2(String searchKeyword);

	public int selectMgzTotalCount3(String searchKeyword);

	public int selectMgzTotalCount4(String searchKeyword);

	public int selBm_no();
	
	public void bizMgzImgWrite(int bm_no, String originFile, String changeFile);
	
	public ArrayList<BizMgzImgDto> selectBizMgzImg(String bm_no);

	
	

//	리뷰 게시판 메소드
	
	
	public ArrayList<BizRvDto> bizRvList(int rowStart, int rowEnd, String searchKeyword, String selNum);
	
	public void bizRvWrite(String br_content, String br_writer, String br_point, String biz_idno, String user_idno);

	public int selBr_no();

	public void bizRvImgWrite(int br_no, String originFile, String changeFile);

//	public void bizRvUpHit(String br_no);

	public BizRvDto bizRvContentView(String br_no);

	public ArrayList<BizRvImgDto> selectBizRvImg(String br_no);

	public void bizRvMod(String br_no, String br_point, String br_content);

	public void bizRvDel(String br_no);

	public void bizRvImgDel(String br_no);

	public int selectRvTotalCount1(String searchKeyword);
	
	public int selectRvTotalCount2(String searchKeyword);
	
	public int selectRvTotalCount3(String searchKeyword);
	
	public int selectRvTotalCount4(String searchKeyword);

	public ArrayList<BizRvDto> getRvImgJoin();

	public void bizRvReport(String br_no, String user_idno, String cause);

	public BizRvDto bizRvReportResultView(String br_no);

	public Integer bizRvLikeCnt(String br_no, String user_idno);

	public void bizRvLikeDel(String user_idno, String br_no);

	public void bizRvLikeAdd(String user_idno, String br_no);

	public int bizRvAllUserLikeCnt(String br_no);

	public void bizRvLikeSubt(String br_no);

	public void bizRvLikePlus(String br_no);
	
	public BizRvDto bizRvReportedInfo(String br_no);

	public void bizRvReportedWrite(String brr_content, String brr_writer, int brr_like_cnt, Timestamp brr_date,
			float brr_point, int biz_idno, String user_idno, String br_no);


	
	
	
	
	
}
