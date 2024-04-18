package com.tech.ibara.biz.dao;

import java.sql.Timestamp;
import java.util.ArrayList;

import com.tech.ibara.biz.dto.BizCasesDto;
import com.tech.ibara.biz.dto.BizCasesImgDto;
import com.tech.ibara.biz.dto.BizHomeBmarkDto;
import com.tech.ibara.biz.dto.BizHomeDto;
import com.tech.ibara.biz.dto.BizMgzDto;
import com.tech.ibara.biz.dto.BizMgzImgDto;
import com.tech.ibara.biz.dto.BizRvDto;
import com.tech.ibara.biz.dto.BizRvImgDto;
import com.tech.ibara.biz.dto.BizSearchTempDto;

public interface BizIDao {

	
	
	
//	시공사례 게시판 메소드
	
	public ArrayList<BizCasesDto> bizCasesList(int rowStart, int rowEnd, String searchKeyword, String string, String inteno);

	public void bizCasesWrite(String bc_title, String bc_content, String bc_writer, String inteno);

	public int selBc_no();

	public void bizCasesImgWrite(int bc_no, String originFile, String changeFile, String inteno);

	public void bizCasesUpHit(String bc_no);

	public BizCasesDto bizCasesContentView(String bc_no);

	public ArrayList<BizCasesImgDto> selectBizCasesImg(String bc_no);

	public void bizCasesMod(String bc_no, String bc_title, String bc_content);

	public BizCasesDto bizCasesDelView(String bc_no);

	public void bizCasesDel(String bc_no);

	public void bizCasesImgDel(String bc_no);

	public int selectCasesTotalCount1(String searchKeyword, String inteno);

	public int selectCasesTotalCount2(String searchKeyword, String inteno);

	public int selectCasesTotalCount3(String searchKeyword, String inteno);

	public int selectCasesTotalCount4(String searchKeyword, String inteno);

	public int selectCasesTotalCount5(String inteno);
	
	
//	매거진 게시판 메소드
	
	public ArrayList<BizMgzDto> bizMgzList(int rowStart, int rowEnd, String searchKeyword, String selNum);

	public BizMgzDto bizMgzContentView(String bm_no);

	public void bizMgzUpHit(String bm_no);

	public void bizMgzMod(String bm_no, String bm_title, String bm_content);

	public BizMgzDto bizMgzDelView(String bm_no);
	
	public void bizMgzDel(String bm_no);
	
	public void bizMgzImgDel(String bm_no);

	public void bizMgzWrite(String bm_title, String bm_content, String bm_writer, String memno);

	public int selectMgzTotalCount1(String searchKeyword);

	public int selectMgzTotalCount2(String searchKeyword);

	public int selectMgzTotalCount3(String searchKeyword);

	public int selectMgzTotalCount4(String searchKeyword);

	public int selBm_no();
	
	public void bizMgzImgWrite(int bm_no, String originFile, String changeFile);
	
	public ArrayList<BizMgzImgDto> selectBizMgzImg(String bm_no);

	
	

//	리뷰 게시판 메소드
	
	
	public ArrayList<BizRvDto> bizRvList(int rowStart, int rowEnd, String searchKeyword, String selNum, String inteno);
	
	public void bizRvWrite(String br_content, String br_writer, String br_point, String inteno, String memno);

	public int selBr_no();

	public void bizRvImgWrite(int br_no, String originFile, String changeFile);

//	public void bizRvUpHit(String br_no);

	public BizRvDto bizRvContentView(String br_no);

	public ArrayList<BizRvImgDto> selectBizRvImg(String br_no);

	public void bizRvMod(String br_no, String br_point, String br_content);

	public void bizRvDel(String br_no);

	public void bizRvImgDel(String br_no);

	public int selectRvTotalCount1(String searchKeyword, String inteno);
	
	public int selectRvTotalCount2(String searchKeyword, String inteno);
	
	public int selectRvTotalCount3(String searchKeyword, String inteno);
	
	public int selectRvTotalCount4(String searchKeyword, String inteno);

	public ArrayList<BizRvDto> getRvImgJoin();

	public void bizRvReport(String br_no, String memno, String cause);

	public BizRvDto bizRvReportResultView(String br_no);

	public Integer bizRvLikeCnt(String br_no, String memno);

	public void bizRvLikeDel(String memno, String br_no);

	public void bizRvLikeAdd(String memno, String br_no);

	public int bizRvAllUserLikeCnt(String br_no);

	public void bizRvLikeSubt(String br_no);

	public void bizRvLikePlus(String br_no);
	
	public BizRvDto bizRvReportedInfo(String br_no);

	public void bizRvReportedWrite(String brr_content, String brr_writer, String br_no);

	
	
//	업체홈 함수
	
	public BizHomeDto bizHome(String inteno);

	public BizHomeBmarkDto bizHomeBmark(String memno, String inteno);

	public float bizHomeRvPointAvg(String inteno);

	public Integer bizHomeRvCnt(String inteno);

	public void bizHomeBmarkAdd(String memno, String inteno);

	public void bizHomeBmarkDel(String memno, String inteno);

	public ArrayList<Integer> getBmarkedHomesByUser(String memno);

	public Integer bizHomeCheckBmarkedCnt(String memno, String inteno);

	public void bizHomeBmarkSubt(String bh_no);

	public void bizHomeBmarkPlus(String bh_no);

	public Integer bizHomeCasesCnt(String inteno);

	public ArrayList<BizCasesImgDto> bizHomeCasesImgList(String inteno);

	public ArrayList<BizRvDto> bizHomeRvImgList(String inteno);

	public void BizHomeInfoMod(String bh_no, String bhImgNew, String bh_notice, String bh_intro, String bh_name,
			String bh_pro, String bh_addr1, String bh_addr2, String inteno);

	
//	search 주소메인
	
//	public ArrayList<BizHomeDto> bizHomeSearch();
	
	public ArrayList<BizHomeDto> findHomeLikeInputAddr(String inputAddrFromAPI);

	public ArrayList<BizHomeDto> sortAddrHomeBmarkCnt(String inputAddrFromAPI);

	public ArrayList<BizHomeDto> sortAddrHomeContCnt(String inputAddrFromAPI);

	public Float bizSearchRvPointAvg(int inteno);


	public ArrayList<BizRvDto> bizRvContentListJoin();

	public ArrayList<BizRvDto> bizRvContentListJoinAddr(String addrToSearch);

	public ArrayList<BizHomeDto> findHomeLikeInputStar(String addrToSearch);

	public ArrayList<BizSearchTempDto> bizStarAvgNoList(String addrToSearch);

	public Float bizStarAvgforNo(int inteno);

	public ArrayList<BizRvDto> bizRvContentListJoinStar(String addrToSearch);

	public ArrayList<BizSearchTempDto> BizRvTempStaravg(String addrToSearch);

	public void bizStarAvgInsert(float brt_staravg, int inteno);

	public void bizStarAvgUpdate(float brt_staravg, int inteno);
	
	public Integer bizRvTempBizIdnoCheck(int inteno);

	public ArrayList<BizSearchTempDto> bizRvCntNoList(String addrToSearch);

	public void bizRvCntUpdate(float bst_staravg, int bst_rvcnt, int inteno);

	public void bizRvCntInsert(float bst_staravg, int bst_rvcnt, int inteno);

	public ArrayList<BizHomeDto> findHomeLikeInputRvCnt(String addrToSearch);

	public ArrayList<BizRvDto> bizRvContentListJoinRvCnt(String addrToSearch);

	public ArrayList<BizHomeDto> findHomeLikeInputContCnt(String addrToSearch);

	public ArrayList<BizRvDto> bizRvContentListJoinContCnt(String addrToSearch);

	public ArrayList<BizHomeDto> bizSearchHomeList(int rowStart, int rowEnd, String searchKeyword, String string);

	public int selectAddrSearchTotalCount1(String searchKeyword);

	public int selectAddrSearchTotalCount2(String searchKeyword);

	public ArrayList<BizHomeDto> findHomeLikeInputPro(String bh_pro);

	public ArrayList<BizRvDto> bizRvContentListJoinPro(String bh_pro);

	public ArrayList<BizSearchTempDto> bizStarAvgNoListPro(String bh_pro);

	public ArrayList<BizHomeDto> findHomeLikeInputProStar(String bh_pro);

	public ArrayList<BizRvDto> bizRvContentListJoinProStar(String bh_pro);

	public ArrayList<BizSearchTempDto> bizRvCntNoListPro(String bh_pro);

	public ArrayList<BizHomeDto> findHomeLikeInputProRvCnt(String bh_pro);

	public ArrayList<BizRvDto> bizRvContentListJoinProRvCnt(String bh_pro);

	public ArrayList<BizHomeDto> findHomeLikeInputProContCnt(String bh_pro);

	public ArrayList<BizRvDto> bizRvContentListJoinProContCnt(String bh_pro);

	public ArrayList<BizRvDto> getRvImgJoin(String inteno);

	public ArrayList<BizRvDto> bizRvListLikeCnt(int rowStart, int rowEnd, String searchKeyword, String string,
			String inteno);

	public ArrayList<BizRvDto> getRvImgJoinLikeCnt(String inteno);

	public ArrayList<BizRvDto> bizRvListStarCnt(int rowStart, int rowEnd, String searchKeyword, String string,
			String inteno);

	public ArrayList<BizRvDto> getRvImgJoinStarCnt(String inteno);

	public ArrayList<BizRvDto> bizRvListStarCntAsc(int rowStart, int rowEnd, String searchKeyword, String string,
			String inteno);

	public ArrayList<BizRvDto> getRvImgJoinStarCntAsc(String inteno);

	public void bizHomeCreate(String nickname, int inteno);


	

	


	
	
	
	
	
}
